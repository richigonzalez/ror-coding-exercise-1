class TaskMailer < ApplicationMailer
  def due_date_reminder(task)
    # mocked email
    @task = task

    puts "due_date_reminder email delivered!"
    true
  end
end
