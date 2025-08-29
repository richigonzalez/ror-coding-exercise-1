class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true, uniqueness: { scope: :project_id }
  validate :validate_due_at!

  private

  # make sure due_at is not in the past
  def validate_due_at!
    if due_at.present? && due_at < Time.current
      errors.add(:due_at, "cannot be in the past")
      throw(:abort)
    end
  end
end
