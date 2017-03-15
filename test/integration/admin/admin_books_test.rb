require 'test_helper'

class AdminBooksTest < ActionDispatch::IntegrationTest

  test 'Admins can view all books' do
    get '/admin/books'
    assert_select 'p', 'A tale of two cities'
    assert_select 'button', 'Add a new book'

  end

  test 'Admins can view a single book' do
    get '/admin/books/1/edit'
    assert_select 'h2', 'A tale of two cities'
    assert_select "p", '1903'
    assert_select "p", 'Charles Dickens'
    assert_select 'button', 'Update'
    assert_select 'button', 'Delete'
  end
end
