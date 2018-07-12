class Task < ApplicationRecord
  validates :title, :description, :end_at, :status, :priority ,presence: true  

  enum status: [:pending, :ongoing, :finished]
  enum priority: [:low, :medium, :high]

end