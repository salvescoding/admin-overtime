Post.delete_all

@user = User.create!(email: "po@po.com", first_name: "Sergio", last_name: "Alves", password: "password", password_confirmation: "password")
puts "All posts deleted"

100.times do
  Post.create!(date: Date.today, rationale: Faker::Coffee.blend_name, user_id: @user.id)
end

puts "100 posts have been created"
