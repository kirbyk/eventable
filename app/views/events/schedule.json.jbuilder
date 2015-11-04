json.array!(@schedule_items) do |item|
  json.id item.id
  json.title item.title
  json.description item.description
  json.start_time item.start_time
  json.end_time item.end_time
end
