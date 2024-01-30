json.extract! topic, :id, :title, :description, :position, :nav_pos, :icon, :created_at, :updated_at
json.url topic_url(topic, format: :json)
