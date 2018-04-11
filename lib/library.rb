class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
    book
  end

  def include?(work)
    @books.any? {|book| book.title == work}
  end

end
