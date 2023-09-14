json.extract! comment, :id, :content, :likes, :dislikes, :created_at, :updated_at
json.url comment_url(comment, format: :json)
