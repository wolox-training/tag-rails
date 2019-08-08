class OpenLibraryService
  def retrieve_book_information(isbn)
    response = HTTParty.get(
      'https://openlibrary.org/api/books',
      query: { bibkeys: isbn, format: 'json', jscmd: 'data' }
    )

    return { error: "Cannot find a book for provided ISBN: '#{isbn}'" } if response.nil?

    book_information = JSON.parse(response.body)[isbn]
                           .deep_symbolize_keys
                           .slice(:title, :subtitle, :number_of_pages, :authors)

    book_information[:authors].map! { |author| author[:name] }
    book_information.merge!(ISBN: isbn)
  end
end
