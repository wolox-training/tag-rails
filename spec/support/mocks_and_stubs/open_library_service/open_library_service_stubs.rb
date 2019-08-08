require 'rails_helper'

class OpenLibraryServiceStubs
  include WebMock::API

  def book_information_request_success
    stub_request(:get, 'https://openlibrary.org/api/books')
      .with(
        query:
          { bibkeys: 'ISBN:0385472579', format: 'json', jscmd: 'data' }
      )
      .to_return(
        status: :ok,
        body: File.read('./spec/support/fixtures/book_information_request_success.json')
      )
  end

  def book_information_request_error
    stub_request(:get, 'https://openlibrary.org/api/books')
      .with(
        query:
          { bibkeys: 'IS:0385472579', format: 'json', jscmd: 'data' }
      )
      .to_return(
        status: :ok,
        body: '{}',
        headers: { 'content-type': ['application/json'] }
      )
  end
end
