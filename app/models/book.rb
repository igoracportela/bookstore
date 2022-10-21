class Book < ApplicationRecord
  has_many :reviews

  validates :title, presence: true, uniqueness: true
  validates :stock, numericality: { only_integer: true }

  before_create -> (book) do
    book.slug = book.title.parameterize
  end
end
