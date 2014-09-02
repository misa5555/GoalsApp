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

def fill_in_title
  fill_in 'Title', with: 'Run a marathon'
end

def check_private
  check('Private')
end

def fill_in_body
  fill_in 'Body', with: 'Get to the finish line'
end

def create_a_goal
  visit "/goals/new"
  fill_in_title
  fill_in_body
  check_private
  click_button('New Goal')
end

def create_user_2
  visit new_user_url
  fill_in "Username", with: "User2"
  fill_in "Password", with: "Password123"
  click_on "Create User"
end
