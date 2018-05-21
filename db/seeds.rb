Post.delete_all

puts "All posts deleted"

100.times do
  Post.create!(date: Date.today, rationale: Faker::Coffee.blend_name)
end

puts "100 posts have been createdc"
