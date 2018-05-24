require './test/test_helper.rb'
require './lib/book.rb'
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
end
