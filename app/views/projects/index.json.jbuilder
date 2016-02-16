json.array!(@projects) do |project|
  json.extract! project, :id, :url, :title, :youtube, :description, :view
  json.url project_url(project, format: :json)
end
