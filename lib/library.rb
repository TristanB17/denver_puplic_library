class Library
  attr_reader   :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(work)
    titles = @books.map do |book|
      book.title
    end
    titles.include?(work)
  end

  def card_catalogue
    alpha = @books.map do |book|
      book.author_last_name
    end
    alpha.sort
  end

  def find_by_author(author)
    author_last = author.split(" ")[1]
    author_hash = {}
    @books.map do |book|
      if book.author_last_name == author_last
        author_hash[book.title] = book
      end
    end
    author_hash
  end

  def find_by_publication_date(date)
    date_hash = {}
    years =  @books.map do |book|
      if book.publication_date[-4..-1] == date
        date_hash[book.publication_date[-4..-1]] = book
      end
    end
    date_hash
  end
end
