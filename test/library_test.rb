require './test/test_helper.rb'
require './lib/author.rb'
require './lib/library.rb'

class LibraryTest < Minitest::Test
  def test_library_starts_with_no_books
    dpl = Library.new

    assert_equal [], dpl.books
  end

  def test_library_can_add_books_to_collection
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
    assert_equal 1, dpl.books.count
    assert_equal jane_eyre, dpl.books[0]

    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_equal 3, dpl.books.count
    assert_equal mockingbird, dpl.books[1]
    assert_equal villette, dpl.books[2]
  end
end
