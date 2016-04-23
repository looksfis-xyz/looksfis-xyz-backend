json.post do
  json.user_id        @post.user_id
  json.is_complete    @post.is_complete
  json.title          @post.title
  json.longitude      @post.longitude
  json.latitude       @post.latitude
  json.radius         @post.radius
  json.type           @post.type
  json.report_date    @post.report_date
  json.incentive      @post.incentive
  json.founder_id     @post.founder_id
  json.found_date     @post.found_date
  json.fishing_gear do 
    json.category_id                         @post.fishing_gear.category_id
    json.name                                @post.fishing_gear.name
    json.mesh_size                           @post.fishing_gear.mesh_size
    json.length                              @post.fishing_gear.length
    json.width                               @post.fishing_gear.width
    json.weight                              @post.fishing_gear.weight
    json.color                               @post.fishing_gear.color
    json.comment                             @post.fishing_gear.comment
    json.production_country_alpha2           @post.fishing_gear.production_country_alpha2
  end
end


