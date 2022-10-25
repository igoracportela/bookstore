class Review < ApplicationRecord
  belongs_to :book

  validates :title, :description, presence: true
  validates :score, numericality: { only_integer: true }
end
