require 'rails_helper'

describe Api::V1::BookInformationController, type: :controller do
  describe 'GET #book_information' do
    context 'when receiving a valid ISBN' do
      let!(:valid_isbn) { 'ISBN:0385472579' }
      let!(:book_info_result) do
        JSON.parse(
          File.read('./spec/support/fixtures/retrieve_book_information_result.json'),
          symbolize_names: true
        )
      end

      before do
        stubbed_service = instance_double(OpenLibraryService)
        allow(stubbed_service).to receive(:retrieve_book_information).and_return(book_info_result)
        allow(OpenLibraryService).to receive(:new).and_return(stubbed_service)
        get :book_information, params: { isbn: valid_isbn }
      end

      it 'responds with status ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'responds with the book information' do
        expect(response.body).to eq book_info_result.to_json
      end
    end

    context 'when receiving an invalid ISBN' do
      let!(:invalid_isbn) { 'IS:0385472579' }
      let!(:error_message) { "Cannot find a book for provided ISBN: '#{invalid_isbn}'" }

      before do
        stubbed_service = instance_double(OpenLibraryService)
        book_info_result = { error: error_message }

        allow(stubbed_service).to receive(:retrieve_book_information).and_return(book_info_result)
        allow(OpenLibraryService).to receive(:new).and_return(stubbed_service)
        get :book_information, params: { isbn: invalid_isbn }
      end

      it 'responds with status not found' do
        expect(response).to have_http_status(:not_found)
      end

      it 'responds with an error message' do
        expect(response.body).to eq error_message
      end
    end
  end
end
