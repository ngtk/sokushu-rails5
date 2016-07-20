json.array!(@books) do |book|
  json.extract! book, :id, :title, :price_in_cents
  json.url book_url(book, format: :json)
end
