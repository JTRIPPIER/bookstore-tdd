require 'test_helper'

class ReviewsTest < ActionDispatch::IntegrationTest

  test 'User can see all reviews' do
      # get '/reviews'
      get reviews_path

      assert_select 'li', 'Great book'
      assert_select 'li', 'Rubbish book'
  end

  test 'User can see reviews for a book' do
       book = books(:one)
       get book_reviews_path(book)

       assert_select 'li', 'Great book'
       assert_select "p", book.title
  end
  #
  # test 'User can add a review' do
  #     get '/books'
  #     assert_select 'p', 'A tale of two cities'
  # end

end
