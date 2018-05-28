namespace :notification do
  desc "Sends SMS notification to employees"
  task sms: :environment do
    puts "I am in a Rake Task"
  end

end
