require 'test_helper'

class BooksTest < ActionDispatch::IntegrationTest

  test 'User can see a list of books' do
      get '/books'
      assert_select 'p', 'A tale of two cities'
  end

  test 'User can see details of one book' do
       book = books(:one)
       get book_path(book)
       assert_select 'h2', 'A tale of two cities'
       assert_select "p", '1903'
       assert_select "p", 'Charles Dickens'
  end

end
