require 'test_helper'

class AdminBooksTest < ActionDispatch::IntegrationTest

  test 'Admins can view all books' do
    get '/admin/books'
    assert_select 'a', 'A tale of two cities'
    assert_select 'button', 'Add a new book'
  end

  test 'Admins can edit a single book' do
    @book = books(:one)
    get "/admin/books/#{@book.id}/edit"
    #visit edit_admin_book_path(@book)

    assert_select 'input' do
      assert_select "[value=?]", @book.title
    end
    assert_select 'input' do
      assert_select "[value=?]", 'Update Book'
    end
    assert_select 'button', 'Delete'
  end

  test 'Admins can create a new book' do
    assert_equal 1, Book.count

    visit new_admin_book_path

    fill_in "Title", with: "1984"
    fill_in "Author", with: "George Orwell"
    fill_in "Year", with: "1948"
    click_button "Create Book"

    assert_equal 2, Book.count

    get '/admin/books'
    assert_select 'a', '1984'
  end
end
