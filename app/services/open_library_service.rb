class OpenLibraryService
  include HTTParty
  base_uri 'openlibrary.org'

  def options(isbn)
    { query: { bibkeys: isbn, format: 'json', jscmd: 'data' } }
  end

  def retrieve_book_information(isbn)
    handle_response(self.class.get('/api/books', options(isbn)), isbn)
  end

  def handle_response(response, isbn)
    return { error: "Cannot find a book for provided ISBN: '#{isbn}'" } if response.blank?

    book_information = JSON.parse(response.body)[isbn]
                           .deep_symbolize_keys
                           .slice(:title, :subtitle, :number_of_pages, :authors)

    book_information[:authors].map! { |author| author[:name] }
    book_information.merge!(ISBN: isbn)
  end
end
