class SearchController < ApplicationController
  def index
    @query = params[:q]
    
    if @query.present?
      @books = Book.includes(:author, :subjects)
                   .where("books.title ILIKE ? OR books.description ILIKE ? OR authors.name ILIKE ? OR subjects.name ILIKE ?", 
                          "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%")
                   .joins(:author)
                   .left_joins(:subjects)
                   .distinct
    else
      @books = Book.includes(:author, :subjects).limit(10)
    end
  end
end
