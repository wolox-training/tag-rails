require 'rails_helper'

describe OpenLibraryService, type: :service do
  let!(:service) { described_class.new }
  let!(:stubs) { OpenLibraryServiceStubs.new }

  describe '#retrieve_book_information' do
    context 'when retrieving info on a book with valid ISBN' do
      let!(:valid_isbn) { 'ISBN:0385472579' }

      before do
        stubs.book_information_request_success
        service.retrieve_book_information valid_isbn
      end

      it 'makes an external request' do
        expect(a_request(:get, 'openlibrary.org/api/books')
                .with(query: { bibkeys: valid_isbn, format: 'json', jscmd: 'data' }))
          .to have_been_made
      end

      it 'returns a hash with expected attributes' do
        expected = JSON.parse(
          File.read('./spec/support/fixtures/retrieve_book_information_result.json'),
          symbolize_names: true
        )

        expect(service.retrieve_book_information(valid_isbn)).to eq expected
      end
    end

    context 'when retrieving info on a book with invalid ISBN' do
      let!(:invalid_isbn) { 'IS:0385472579' }

      before do
        stubs.book_information_request_error
        service.retrieve_book_information invalid_isbn
      end

      it 'makes and external request' do
        expect(a_request(:get, 'openlibrary.org/api/books')
                .with(query: { bibkeys: invalid_isbn, format: 'json', jscmd: 'data' }))
          .to have_been_made
      end

      it 'returns a hash with an error message' do
        expected = { error: "Cannot find a book for provided ISBN: '#{invalid_isbn}'" }

        expect(service.retrieve_book_information(invalid_isbn)).to eq expected
      end
    end
  end
end
