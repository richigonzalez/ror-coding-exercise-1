module Projects
  class SummariesController < ApplicationController
    # GET /projects/1/summary
    # Returns a json summary like:
    # {
    #   title: 'project title',
    #   tasks_count: 10,
    #   completed_tasks_count: 5,
    #   pending_tasks_count: 5
    #   overdue_tasks_count: 1
    # }
    def show
      render json: {
        title: 'project title',
        tasks_count: 10,
        completed_tasks_count: 5,
        pending_tasks_count: 5,
        overdue_tasks_count: 1,
      }, status: :ok
    end
  end
end
