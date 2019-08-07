class OpenLibraryService
  def retrieve_book_information(isbn)
    url = "https://openlibrary.org/api/books?bibkeys=#{isbn}&format=json&jscmd=data"
    response = HTTParty.get(url)

    return { error: "Cannot find a book for provided ISBN: '#{isbn}'" } if response.empty?

    book_information = JSON.parse(response.body)[isbn]
                           .deep_symbolize_keys
                           .slice(:title, :subtitle, :number_of_pages, :authors)

    book_information[:authors].map! { |author| author[:name] }
    book_information.merge!(ISBN: isbn)
  end
end
