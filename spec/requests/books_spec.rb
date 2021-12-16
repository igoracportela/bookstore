require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:token) { nil }

  describe "GET/books" do
    let(:url) { "/api/books" }
    let!(:book) { create_list(:book, 20) }

    it "returns all books" do
      get url
      expect(JSON.parse(response.body).size).to eq 20
    end

    it "returns success status" do
      get url
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST/books" do
    let(:url) { "/api/books" }
    let(:params) { { title: "Test1", stock: 10 } }

    it 'return new book' do
      post url, params: params
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'returns status code 200' do
      post url, params: params
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH/books/:id" do
    let(:url) { "/api/books/#{book.id}" }
    let!(:book) { create(:book) }
    let(:new_title) { 'My new book' }
    let(:book_params) { { title: new_title } }

    it 'update book' do
      patch url, params: book_params
      book.reload
      expect(book.title).to eq(new_title)
    end
  end

  describe "DELETE/books" do
    let(:url) { "/api/books/#{book.id}" }
    let!(:book) { create(:book) }

    it 'removes book' do
      expect do
        delete url
      end
    end

    it 'returns success status' do
      delete url
      expect(response).to have_http_status(:success)
    end
  end
end
