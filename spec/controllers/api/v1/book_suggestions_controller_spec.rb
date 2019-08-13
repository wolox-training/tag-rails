require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'when creating a book suggestion with required attributes for an existing user' do
      include_examples 'book suggestion created successfully', true
    end

    context 'when creating a book suggestion with required attributes for a guest user' do
      include_examples 'book suggestion created successfully', false
    end

    context 'when creating a book suggestion for a non existing user' do
      let!(:book_suggestion) { build(:book_suggestion, user_id: 456) }

      before do
        post :create, params: { book_suggestion: JSON.parse(book_suggestion.to_json) }
      end

      it 'responds with unprocessable entity status' do
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    %i[author title link editor year].each do |required_field|
      context "when creating a book suggestion with missing #{required_field}" do
        let!(:book_suggestion) { attributes_for(:book_suggestion, required_field => nil) }

        before do
          post :create, params: { book_suggestion: book_suggestion }
        end

        it 'responds with unprocessable entity status' do
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end
  end
end
