json.array!(@updates) do |update|
  json.id update.id
  json.title update.title
  json.description update.description
end
