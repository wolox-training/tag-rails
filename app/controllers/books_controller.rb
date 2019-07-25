# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    books = Book.all
    render json: { books: books }, status: :ok
  end

  def show
    book = Book.find(params[:id])
    render json: { book: book }, status: :ok
  end
end
