class Api::BooksController < ApplicationController
  before_action :load_books, only: %i[show update destroy edit]
  protect_from_forgery with: :null_session

  def index
    book_params[:limit] = 20 if book_params[:limit].blank?
    @books = Book.order('created_at DESC').limit(book_params[:limit])

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
    return delete_copies if book_params[:stock].present?

    @book.destroy!
    head :no_content
  rescue
    render json: @book.errors, status: :unprocessable_entity
  end

  def delete_copies
    @book.stock -= book_params[:stock].to_i
    save_book!
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
    params.permit(:title, :stock, :limit)
  end

  def save_book!
    @book.save!
    render json: @book, status: :ok
  rescue
    render json: @book.errors, status: :unprocessable_entity
  end
end
