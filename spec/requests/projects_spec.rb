require 'rails_helper'

RSpec.describe "Projects API", type: :request do
  describe "GET /projects" do
    let!(:projects) { create_list(:project, 3) }

    it "returns all projects" do
      get "/projects"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "POST /projects" do
    context "with valid params" do
      let(:valid_params) { { project: { title: "New Project" } } }

      it "creates a project" do
        post "/projects", params: valid_params
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)["title"]).to eq("New Project")
      end
    end

    context "with invalid params" do
      let(:invalid_params) { { project: { title: "" } } }

      it "does not create a project" do
        post "/projects", params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to have_key("title")
      end
    end
  end
end
