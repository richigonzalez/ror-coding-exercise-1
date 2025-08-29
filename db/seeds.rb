# Create 5 projects
5.times do
  Project.create!(title: "#{Faker::Company.bs.titleize} Project")
end

# Create 5 tasks for each project
# Ensure at least one task is overdue and one is completed
# The rest can be random
# Use Faker to generate random titles
# Use rand to generate random due dates within the next 30 days
Project.all.each do |project|
  5.times do |j|
    title = "#{Faker::Verb.base.capitalize} #{Faker::Hobby.activity}"
    due_at = if j == 0
                 # First task is overdue
                 Date.today - rand(1..5).days
               else
                 # Random due date within next 30 days
                 Date.today + rand(1..30).days
               end
    
    is_completed = (j == 1) # Second task is completed

    task = Task.new(
      title: title,
      due_at: due_at,
      completed_at: is_completed ? Time.now : nil,
      project: project
    )

    task.save(validate: false) # Skip validations to allow tasks due in the past
  end
end
