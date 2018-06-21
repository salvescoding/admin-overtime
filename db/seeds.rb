Post.delete_all
AuditLog.delete_all
User.delete_all
Employee.delete_all
AdminUser.delete_all
puts "All posts deleted"
puts "All users deleted"


AdminUser.create!(email: "admin@user.com",
                  first_name: "Sergio",
                  last_name: "Alves",
                  password: "password",
                  password_confirmation: "password",
                  phone: "555938395"
                  )
@employee = Employee.create!(email: "user@user.com",
                     first_name: "Marise",
                     last_name: "Kamp",
                     password: "password",
                     password_confirmation: "password",
                     phone: 842794923
                     )

puts "admin user and users created"

reasons = ["I have to work a lot", "They broke everything and I have to fix it now"]

12.times do
  Post.create!(date: Date.today, rationale: reasons.sample, user_id: @employee.id, overtime_request: [2.0, 4.7, 1.5, 20.0].sample)
end

puts "100 posts have been created"

AuditLog.create!(user_id: @employee.id,  status: 0, start_date: Date.today - 6.days)
AuditLog.create!(user_id: @employee.id,  status: 0, start_date: Date.today - 13.days)
AuditLog.create!(user_id: @employee.id,  status: 0, start_date: Date.today - 20.days)

puts "3 audit logs created"
