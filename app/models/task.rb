class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 100 }
  validates :status, presence: true, length: { maximum: 10 }
end
