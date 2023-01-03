class BooksController < ApplicationController
  before_action :authorize_request_for_admin 
  # before_action :set_book, only: [:show, :update, :destroy]

  def index
    # byebug
      books = @current_user.books
      render json: books, each_serializer: BookSerializer, status: :ok
  end
  
  def create
    # byebug  
    book = @current_user.books.new(book_params)
    if book.save
      render json: BookSerializer.new(book).serializable_hash, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
  end
  end

  def destroy
    if @book.destroy
      render json: {message: "book deleted "}
    else
      render json: @book.errors, status: :unprocessable_entity
    end
   end

  private

  # def set_book
  #   @book = Admin.books.find_by_id(params[:id])
  #   render json: {message: "admin create a book"}
  # end

  def book_params
    params.require(:book).permit(:title, :author, :subject, :price)
  end
end
