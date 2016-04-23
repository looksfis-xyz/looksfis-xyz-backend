# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(
  first_name: "tester first name",
  last_name:  "tester last name",
  email: "tester@email.com",
  mobile_phone: "6666 6666",
  password: "password",
  password_confirmation: "password",
  is_active: true
)

fishing_net = Category.create!(
  name: "Net",
  code: 1
)
fishing_net = Category.create!(
  name: "Pot",
  code: 2
)
fishing_net = Category.create!(
  name: "Rod",
  code: 3
)

post = LostPost.create(
  user: user,
  is_complete: false,
  title: "Lost a fishing net",
  latitude: 22.246348,
  longitude: 114.153593,
  radius: 5, #km
  report_date: (Time.now - 2.days),
  incentive: "cash 100USD"
)

fishing_gear = FishingGear.create!(
  post:         post,
  category:     fishing_net,

  name:                       "A common fishing gear",
  mesh_size:                  "1_finger_width",
  length:                     10, #m
  width:                      2, #m
  color:                      "blue",
  comment:         "No uniq thing",
  production_country_alpha2:  "CN"
)

post_2 = LostPost.create!(
  user: user,
  is_complete: false,
  title: "Lost a fishing net",
  latitude: 22.246348,
  longitude: 114.153593,
  radius: 5, #km
  report_date: (Time.now - 2.days),
  incentive: "Coupon 100USD for Book shops"
)

fishing_gear_2 = FishingGear.create!(
  post:         post_2,
  category:     fishing_net,

  name:                       "A common fishing gear 2",
  mesh_size:                  "2_finger_width",
  length:                     20, #m
  width:                      4, #m
  color:                      "Red",
  comment:         "Tender Love",
  production_country_alpha2:  "CN"
)

post_3 = LostPost.create!(
  user: user,
  is_complete: false,
  title: "Lost a fishing net",
  latitude: 35.634959,
  longitude: 139.848568,
  radius: 5, #km
  report_date: (Time.now - 2.days),
  incentive: "Coupon 100USD for Book shops"
)

fishing_gear_3 = FishingGear.create!(
  post:         post_3,
  category:     fishing_net,

  name:                       "A common fishing gear 3 in Tykyo",
  mesh_size:                  "3_finger_width",
  length:                     20, #m
  width:                      4, #m
  color:                      "Red",
  comment:                    "Tykyo",
  production_country_alpha2:  "JP"
)
