class Api::BooksController < ApplicationController
  before_action :load_books, only: %i[show update destroy edit]
  # protect_from_forgery with: :null_session
  before_action :validate_token!

  def index
    @books = Book.order('created_at DESC').limit(20)

    render json: @books
  end

  def create
    @book = Book.new
    @book.attributes = book_params
    save_book!
  end

  def show
    render json: @book
  end

  def edit
    render json: @book
  end

  def update
    @book.attributes = book_params
    save_book!
  end

  def destroy
    @book.destroy!
    head :no_content
  rescue
    render json: @book.errors, status: :unprocessable_entity
  end

  private

  def validate_token!
    render json: nil, status: :unauthorized unless validate_token?
  end

  def validate_token?
    request.headers["Authorization"] == BOOKSTORE_TOKEN
  end

  def load_books
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(:title, :stock)
  end

  def save_book!
    @book.save!
    render json: @book, status: :ok
  rescue
    render json: @book.errors, status: :unprocessable_entity
  end
end
