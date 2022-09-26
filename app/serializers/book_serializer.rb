class BookSerializer
  include JSONAPI::Serializer
  attributes :books, :total_books_found, :destination, :forecast, :total_books_found, :books
  set_id nil
  set_type :books
end
