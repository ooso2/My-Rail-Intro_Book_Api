class ReviewsController < ApplicationController
  before_action :set_book, only: [:index, :show, :new, :create]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = @book.reviews.includes(:book)
  end

  def show
  end

  def new
    @review = @book.reviews.build
  end

  def create
    @review = @book.reviews.build(review_params)

    if @review.save
      redirect_to book_review_path(@book, @review), notice: 'Review was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to book_review_path(@review.book, @review), notice: 'Review was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    book = @review.book
    @review.destroy
    redirect_to book_reviews_path(book), notice: 'Review was successfully deleted.'
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to books_path, alert: 'Book not found.'
  end

  def set_review
    @review = Review.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to books_path, alert: 'Review not found.'
  end

  def review_params
    params.require(:review).permit(:rating, :review_text, :reviewer_name, :review_date)
  end
end
