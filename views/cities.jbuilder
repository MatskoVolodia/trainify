json.array!(@cities) do |city|
  json.label city.title
  json.value city.id
end