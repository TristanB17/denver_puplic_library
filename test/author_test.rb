require './test/test_helper.rb'
require './lib/author.rb'

class AuthorTest < Minitest::Test
  def test_author_exists_has_a_book_attribute
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })

    assert_instance_of Author, charlotte_bronte
    assert_equal [], charlotte_bronte.books
  end

  def test_author_can_add_books
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
      })

    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.add_book("Villette", "1853")

    assert_equal 2, charlotte_bronte.books.count
    assert_equal jane_eyre, charlotte_bronte.books[0]
    assert_equal villette, charlotte_bronte.books[1]
  end
end
