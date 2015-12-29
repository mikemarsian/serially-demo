json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :drafted_by, :reviewd_by, :published_by
  json.url post_url(post, format: :json)
end
