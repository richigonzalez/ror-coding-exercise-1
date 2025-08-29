require 'rails_helper'

RSpec.describe "Project Summaries API", type: :request do
  describe "GET /projects/:project_id/summary" do
    let(:project) { Project.create!(title: "Test Project") }

    it "returns the project summary" do
      get "/projects/#{project.id}/summary"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to include(
        "title" => "project title",
        "tasks_count" => 10,
        "completed_tasks_count" => 5,
        "pending_tasks_count" => 5,
        "overdue_tasks_count" => 1,
      )
    end
  end
end
