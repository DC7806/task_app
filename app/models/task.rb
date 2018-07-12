class Task < ApplicationRecord
  validates :title, :description, :end_at, :status ,presence: true  

  enum status: [:pending, :ongoing, :finished]
end