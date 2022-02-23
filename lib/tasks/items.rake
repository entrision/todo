namespace :items do
  desc 'Create a test item'
  task create_test: :environment do
    Item.new(body: "I am A test Message @ #{DateTime.now}").save!
  end
end
