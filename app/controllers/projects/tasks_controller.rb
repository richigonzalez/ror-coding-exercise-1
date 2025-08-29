module Projects
  class TasksController < ApplicationController
    before_action :set_project

    # GET /projects/1/tasks
    def index
      raise NotImplementedError, 'IMPLEMENT ME'
    end

    # POST /projects/1/tasks
    def create
      raise NotImplementedError, 'IMPLEMENT ME'
    end

    private

    def set_project
      @project = Project.find(params.expect(:project_id))
    end
  end
end
