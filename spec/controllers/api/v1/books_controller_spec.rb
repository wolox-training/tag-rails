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

      it 'responds with a paginated all books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BooksSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'when fetching a book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responds with the book json' do
        expect(response.body.to_json) =~ BookSerializer.new(
          book
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
