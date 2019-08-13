module Api
  module V1
    class BookInformationController < ApplicationController
      def book_information
        response = OpenLibraryService.new.retrieve_book_information(params[:isbn])

        if response[:error].present?
          render plain: response[:error], status: :not_found
        else
          render json: response
        end
      end
    end
  end
end
