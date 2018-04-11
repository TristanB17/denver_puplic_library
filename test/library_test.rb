require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/author'
require './lib/book'
require './lib/library'

class LibraryTest < Minitest::Test

  def test_it_exists
    dpl = Library.new

    assert_instance_of Library, dpl
  end

  def test_library_starts_with_no_books
    dpl = Library.new

    assert_equal [], dpl.books
  end

  def test_library_can_add_books
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")

    harper_lee  = Author.new({
      first_name: "Harper",
      last_name: "Lee"
      })
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl = Library.new

    dpl.add_to_collection(jane_eyre)
    assert_instance_of Book, dpl.books[0]
    assert_equal 1, dpl.books.length
  end

end
