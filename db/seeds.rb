Post.delete_all
User.delete_all
puts "All posts deleted"
puts "All users deleted"


AdminUser.create!(email: "admin@user.com",
                  first_name: "Sergio",
                  last_name: "Alves",
                  password: "password",
                  password_confirmation: "password",
                  phone: "555938395"
                  )
@user = User.create!(email: "p@p.com",
                     first_name: "Marise",
                     last_name: "Kamp",
                     password: "password",
                     password_confirmation: "password",
                     phone: 842794923
                     )

puts "admin user and users created"

100.times do
  Post.create!(date: Date.today, rationale: Faker::Coffee.blend_name, user_id: @user.id, overtime_request: [2.0, 4.7, 1.5, 20.0].sample)
end

puts "100 posts have been created"
