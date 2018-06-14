namespace :notification do
  desc "Sends SMS notification to employees"
  task sms: :environment do
    puts "I am in a Rake Task"
  end

  desc "Sends mail notification to admin users each day to inform of pending overtime requests"
  task manager_email: :environment do
    sub_posts = Post.submitted
    admin_users = AdminUser.all
    if sub_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end

end
