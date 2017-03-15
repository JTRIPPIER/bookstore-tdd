require 'test_helper'

class ReviewsTest < ActionDispatch::IntegrationTest

  test 'User can see all reviews' do
      get '/reviews'
      # visit books_reviews_path
      assert_select 'li', 'Great book'
      assert_select 'li', 'Rubbish book'
  end
  # test 'User can see reviews for a book' do
  #      get '/books/1/reviews'
  #      visit books_reviews_path
  #
  #      assert_select 'li', 'Great Book'
  #      assert_select "p", '1903'
  #      assert_select "p", 'Charles Dickens'
  # end
  #
  # test 'User can add a review' do
  #     get '/books'
  #     assert_select 'p', 'A tale of two cities'
  # end

end
