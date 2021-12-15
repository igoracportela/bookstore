class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :stock, numericality: { only_integer: true }
end
