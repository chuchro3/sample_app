namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin = User.create!(:name => "Robert",
                 :email => "chuchro3@illinois.edu",
                 :password => "robert",
                 :password_confirmation => "robert")
    admin.toggle!(:admin)
    admin.save

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    #admin.toggle!(:admin)
    end
  end
end
