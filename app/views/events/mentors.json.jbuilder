json.array!(@mentors) do |mentor|
  json.id mentor.id
  json.name mentor.name
  json.company mentor.company
  json.skills mentor.skills
end
