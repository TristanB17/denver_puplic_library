require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test

  def test_it_exists
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
    assert_instance_of Author, charlotte_bronte
  end

  def test_it_starts_with_no_books
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
    assert_equal [], charlotte_bronte.books
  end

  def test_a_book_can_be_added_to_author
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
    charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    assert_instance_of Book, charlotte_bronte.books[0]
  end

  def test_author_can_hold_multiple_books
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
    charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    assert_instance_of Book, charlotte_bronte.books[0]
    charlotte_bronte.add_book("Villette", "1853")
    assert_instance_of Book, charlotte_bronte.books[1]
    assert_equal 2, charlotte_bronte.books.length
  end

end
