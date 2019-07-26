# frozen_string_literal: true

class BooksController < ApplicationController
  include Wor::Paginate

  def index
    render_paginated Book, each_serializer: BooksSerializer
  end

  def show
    render json: Book.find(params[:id]), status: :ok
  end
end
