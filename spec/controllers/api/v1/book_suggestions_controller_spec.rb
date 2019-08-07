require 'rails_helper'

describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'when creating a book with required attributes for an existing user' do
      before do
        create(:user, id: 1)
      end

      include_examples 'book suggestion created successfully', 1
    end

    context 'when creating a book with required attributes for a guest user' do
      include_examples 'book suggestion created successfully', nil
    end

    context 'when creating a book suggestion for a non existing user' do
      let!(:book_suggestion) { build(:book_suggestion, user_id: 456) }

      it 'raises an invalid foreign key error' do
        params = { book_suggestion: JSON.parse(book_suggestion.to_json) }
        expect { post :create, params: params }.to raise_error(ActiveRecord::InvalidForeignKey)
      end
    end

    %i[author title link editor year].each do |required_field|
      context "when creating a book with missing #{required_field}" do
        let!(:book_suggestion) { build(:book_suggestion, required_field => nil) }

        before do
          post :create, params: { book_suggestion: JSON.parse(book_suggestion.to_json) }
        end

        it 'responds with unprocessable_entity status' do
          expect(response).to have_http_status :unprocessable_entity
        end
      end
    end
  end
end
