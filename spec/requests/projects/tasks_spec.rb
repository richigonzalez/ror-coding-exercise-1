require 'rails_helper'

RSpec.describe "Project Tasks API", type: :request do
  let(:project) { create(:project) }

  describe "GET /projects/:project_id/tasks" do
    before do
      Task.create!(title: "Task 1", project: project, due_at: 1.day.from_now)
      Task.create!(title: "Task 2", project: project, due_at: 2.days.from_now)
    end

    it "returns all tasks for the project" do
      get "/projects/#{project.id}/tasks"

      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(2)
      expect(json_response.map { |t| t["title"] }).to include("Task 1", "Task 2")
    end
  end

  describe "POST /projects/:project_id/tasks" do
    let(:valid_params) { { title: "New Task", due_at: 1.day.from_now } }
    let(:invalid_params) { { title: "", due_at: 1.day.ago } }

    it "creates a new task with valid params" do
      expect {
        post "/projects/#{project.id}/tasks", params: valid_params
      }.to change { Task.count }.by(1)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)["title"]).to eq("New Task")
    end

    it "does not create a task with invalid params" do
      expect {
        post "/projects/#{project.id}/tasks", params: invalid_params
      }.not_to change { Task.count }
      expect(response).to have_http_status(:unprocessable_entity).or have_http_status(:unprocessable_content)
      expect(JSON.parse(response.body)["errors"]).to be_present
    end
  end
end
