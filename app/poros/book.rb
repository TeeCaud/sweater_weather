class Book
  attr_reader :isbn, :title, :publisher
  def initialize(data, id)
    @isbn = id
    @title = data[:"ISBN:#{id}"][:title]
    @publisher = data[:"ISBN:#{id}"][:publishers]
  end
end
