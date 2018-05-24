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

  def test_library_can_find_book_by_book_info
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
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_equal true, dpl.include?("To Kill a Mockingbird")
    assert_equal false, dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_library_can_alphabetize_books_by_last_name
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
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    alphabetical = dpl.card_catalogue

    assert_equal "Bronte", alphabetical[0]
  end

  def test_library_can_find_book_by_book_info
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
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    alphabetical = dpl.card_catalogue

    assert_equal "Bronte", alphabetical[0]
  end

  def test_library_can_search_for_book_with_book_info
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
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    return_author = dpl.find_by_author("Charlotte Bronte")

    assert_equal Hash, return_author.class
    assert_equal "Jane Eyre", return_author.keys[0]
    assert_equal "Villette", return_author.keys[1]

    return_date = dpl.find_by_publication_date("1960")

    assert_equal Hash, return_date.class
    assert_equal "1960", return_date.keys[0]
  end
end
