# frozen_string_literal: true

class BooksController < ApplicationController
  include Wor::Paginate

  def index
    render_paginated Book
  end

  def show
    book = Book.find(params[:id])
    render json: { book: book }, status: :ok
  end
end
