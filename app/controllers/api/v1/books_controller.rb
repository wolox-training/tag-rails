# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken
      include Wor::Paginate

      before_action :authenticate_user!

      def index
        render_paginated Book, each_serializer: BooksSerializer
      end

      def show
        render json: Book.find(params[:id]), status: :ok
      end
    end
  end
end
