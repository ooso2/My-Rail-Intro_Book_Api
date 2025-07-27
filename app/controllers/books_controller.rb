class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.includes(:author, :subjects).all
  end

  def show
    @reviews = @book.reviews.includes(:book)
  end

  def new
    @book = Book.new
    @authors = Author.all
    @subjects = Subject.all
  end

  def create
    @book = Book.new(book_params)
    @authors = Author.all
    @subjects = Subject.all

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @authors = Author.all
    @subjects = Subject.all
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      @authors = Author.all
      @subjects = Subject.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to books_path, alert: 'Book not found.'
  end

  def book_params
    params.require(:book).permit(:title, :isbn, :publish_date, :description, :author_id, subject_ids: [])
  end
end
