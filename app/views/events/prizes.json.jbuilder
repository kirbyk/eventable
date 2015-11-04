json.array!(@prizes) do |prize|
  json.id prize.id
  json.company prize.company
  json.description prize.description
  json.award prize.award
end
