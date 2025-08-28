require 'rails_helper'

RSpec.describe "Projects API", type: :request do
  describe "GET /projects" do
    let!(:projects) { create_list(:project, 3) }

    it "returns all projects" do
      get "/projects"
      expect(response).to have_http_status(:ok)
      expect(json.size).to eq(3)
    end
  end

  describe "POST /projects" do
    it "creates a project" do
      post "/projects", params: { project: { title: "New Project" } }
      expect(response).to have_http_status(:created)
      expect(json["title"]).to eq("New Project")
    end
  end

  describe "GET /projects/:id/summary" do
    let(:project) { create(:project) }
    let!(:tasks) { create_list(:task, 2, project:) }

    it "returns project summary" do
      get "/projects/#{project.id}/summary"
      expect(response).to have_http_status(:ok)
      expect(json["title"]).to eq(project.title)
      expect(json).to include("completed_tasks_count", "pending_tasks_count")
    end
  end
end