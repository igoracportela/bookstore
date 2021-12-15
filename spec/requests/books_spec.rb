require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:token) { ENV['BOOKSTORE_TOKEN'].split(',').last }

  describe "GET/books" do
    let(:url) { "/api/books" }
    let!(:book) { create_list(:book, 20) }

    it "returns all books" do
      get url, headers: build_headers(token: token)
      expect(JSON.parse(response.body).size).to eq 20
    end

    it "returns success status" do
      get url, headers: build_headers(token: token)
      expect(response).to have_http_status(:ok)
    end

    context 'with filters' do
      let!(:book) { create(:book, title: 'book-name') }

      before { get "/api/books?title=#{book.name}" }

      it 'returns filtered participant' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body).size).to eq(1)
      end
    end
  end

  describe "POST/books" do
    let(:url) { "/api/books" }
    let!(:book) { create(:book) }
    let(:params) { { book: attributes_for(:book) }.to_json }

    it 'return new book' do
      post url, headers: build_headers(token: token), params: params
      expect(JSON.parse(response.body).size).to eq(11)
    end

    it 'returns status code 200' do
      post url, headers: build_headers(token: token), params: params
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH/books/:id" do
    let(:url) { "/api/books/#{book.id}" }
    let!(:book) { create(:book) }
    let(:new_name) { 'My new book' }
    let(:book_params) { { book: {name: new_name}}.to_json}

    it 'update book' do
      patch url, headers: build_headers(token: token), params: book_params
      book.reload
      expect(book.name).to eq new_name
    end
  end

  describe "DELETE/books" do
    let(:url) { "/api/books/#{book.id}" }
    let!(:book) { create(:book) }

    it 'removes book' do
      expect do
        delete url, headers: build_headers(token: token)
      end.to change(book, :count).by(-1)
    end

    it 'returns success status' do
      delete url, headers: build_headers(token: token)
      expect(response).to have_http_status(:no_content)
    end
  end
end
