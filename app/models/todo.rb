class Todo < ApplicationRecord
  scope :active, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }

  validates :title, presence: true

  normalizes :title, with: ->(title) { title.strip }

  def self.toggle_all!
    all_completed = Todo.completed.count == Todo.count
    update_all(completed: !all_completed)
  end
end
