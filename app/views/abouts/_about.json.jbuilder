json.extract! about, :id, :default, :body, :created_at, :updated_at
json.url about_url(about, format: :json)
json.body about.body.to_s
