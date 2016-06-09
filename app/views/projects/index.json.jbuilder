json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :latitude, :longitude, :amount
  json.url project_url(project, format: :json)
end
