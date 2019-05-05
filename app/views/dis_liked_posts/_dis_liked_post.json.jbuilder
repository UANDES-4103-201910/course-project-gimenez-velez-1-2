json.extract! dis_liked_post, :id, :post_id, :user_id, :created_at, :updated_at
json.url dis_liked_post_url(dis_liked_post, format: :json)
