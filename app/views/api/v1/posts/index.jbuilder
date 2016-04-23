json.posts @posts do |post|

  json.user_id        post.user_id
  json.is_complete    post.is_complete
  json.title          post.title
  json.longitude      post.longitude
  json.latitude       post.latitude
  json.radius         post.radius
  json.type           post.type
  json.report_date    post.report_date
end


