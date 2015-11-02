json.array!(@schedule_items) do |item|
  json.schedule_id item.id
  json.description item.description
end
