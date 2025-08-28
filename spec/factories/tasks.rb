FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task #{n}" }
    project
  end
end