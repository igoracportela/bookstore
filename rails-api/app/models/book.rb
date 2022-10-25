class Book < ApplicationRecord
  has_many :reviews

  validates :title, :stock, presence: true
  validates :title, uniqueness: true
  validates :stock, numericality: { only_integer: true }

  before_create lambda { |book|
    book.slug = book.title.parameterize
  }
end
