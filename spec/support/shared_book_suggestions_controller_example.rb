shared_examples 'book suggestion created successfully' do |user_id|
  let!(:book_suggestion) { build(:book_suggestion, user_id: user_id) }

  before do
    post :create, params: { book_suggestion: JSON.parse(book_suggestion.to_json) }
  end

  it 'saves the book suggestion to the DB' do
    expect(BookSuggestion.where(
             book_suggestion.attributes.except('id', 'created_at', 'updated_at')
           )).to exist
  end

  it 'responds with not null id, created_at, and updated_at data' do
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_response[:id]).not_to be_nil
    expect(parsed_response[:created_at]).not_to be_nil
    expect(parsed_response[:updated_at]).not_to be_nil
  end

  it 'responds with the details of the book suggestion' do
    book_suggestion_details = JSON.parse(response.body)
                                  .except('id', 'created_at', 'updated_at')
    response_details = JSON.parse(BookSuggestionCreateSerializer.new(book_suggestion).to_json)
                           .except('id', 'created_at', 'updated_at')
    expect(book_suggestion_details.to_json).to eq response_details.to_json
  end

  it 'responds with a created status' do
    expect(response).to have_http_status :created
  end
end
