require 'test_helper'

class BooksTest < ActionDispatch::IntegrationTest

  test 'User can see a list of books' do
      get '/books'
      assert_select 'p', 'A tale of two cities'
  end

  test 'User can see details of one book' do
       get '/books/1'
       assert_select 'h2:nth-child(1)', 'A tale of two cities'
       assert_select "p:nth-child(2)", 'Charles Dickens'
       assert_select "p:nth-child(3)", '1903'
  end

end
