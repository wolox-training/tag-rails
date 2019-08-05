# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'with Authenticated User'

  describe 'GET #index' do
    context 'when fetching all books' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'responds with a paginated json' do
        expect(JSON.parse(response.body)).to be_paginated
      end

      it 'responds with books that include expected attributes' do
        response_books = JSON.parse(response.body, symbolize_names: true)[:page]

        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, serializer: BooksSerializer
        ).to_json

        expect(response_books.to_json).to eq expected
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'when fetching a book with correct id' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responds with the book json' do
        expect(JSON.parse(response.body).to_json).to eq BookSerializer.new(
          book
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when fetching a book with incorrect id' do
      before do
        get :show, params: { id: 1 }
      end

      it 'returns with not found (404) status' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
