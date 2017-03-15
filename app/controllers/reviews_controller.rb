class ReviewsController < ApplicationController
  def index
    if params[:book_id].nil?
      @reviews = Review.all
    else
      @reviews = Review.where("book_id = ?", params[:book_id])
    end

  end
end
