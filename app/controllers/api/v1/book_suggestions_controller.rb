module Api
  module V1
    class BookSuggestionsController < ApplicationController
      def create
        book_suggestion = BookSuggestion.new(permitted_attributes(BookSuggestion))

        if book_suggestion.save
          render json: book_suggestion,
                 serializer: BookSuggestionCreateSerializer,
                 status: :created
        else
          render plain: 'Error creating book suggestion',
                 status: :unprocessable_entity
        end
      end
    end
  end
end
