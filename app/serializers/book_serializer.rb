class BookSerializer
  include JSONAPI::Serializer
  attributes :books, :total_books_found, :destination, :forecast
  set_id nil
  # set_id { nil }
  set_type :books
end
