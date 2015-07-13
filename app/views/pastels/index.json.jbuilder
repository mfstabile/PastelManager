json.array!(@pastels) do |pastel|
  json.extract! pastel, :id, :nome
  json.url pastel_url(pastel, format: :json)
end
