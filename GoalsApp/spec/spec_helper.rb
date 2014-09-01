require 'capybara/rspec'

RSpec.configure do |config|

end

def create_user
  visit new_user_url
  fill_in "Username", with: "Username123"
  fill_in "Password", with: "Password123"
  click_on "Create User"
end

def logout  
  click_on "Logout"
end