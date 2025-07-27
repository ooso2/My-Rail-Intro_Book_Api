class SearchController < ApplicationController
  def index
    @query = params[:q]
    
    if @query.present?
      @books = Book.includes(:author, :subjects)
                   .where("books.title ILIKE ? OR books.description ILIKE ?", "%#{@query}%", "%#{@query}%")
                    (Book.joins(:author).where("authors.name ILIKE ?", "%#{@query}%"))
                   .or(Book.joins(:subjects).where("subjects.name ILIKE ?", "%#{@query}%"))
                   .distinct
    else
      @books = Book.includes(:author, :subjects).limit(10)
    end
  end
end
