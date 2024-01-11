class Todo < ApplicationRecord
  scope :active, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }

  validates :title, presence: true

  normalizes :title, with: ->(title) { title.strip }

  def self.toggle_all!
    update_all(completed: active.any?)
  end

  def update_or_destroy(attributes)
    assign_attributes(attributes)
    if title.blank?
      destroy
    else
      save
    end
    #Ou opérateur ternaire
    #title? ? save : destroy
    #test git
  end
end
