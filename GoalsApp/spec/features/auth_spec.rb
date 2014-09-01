# spec/features/auth_spec.rb

require 'rails_helper'

feature "When user signs up:" do 
  before :each do
    visit "/users/new"
  end
  
  scenario "there is a sign up page" do  
    expect(page).to have_content('Sign Up')
    expect(page).to have_field('Username')
    expect(page).to have_field('Password')
  end

  feature "requires" do
      
    
      scenario "a username" do
        fill_in "Password", with: "password123"
        click_button "Create User"
        expect(page).to have_content("Username can't be blank")
      end
      
      scenario "a password longer than 6 characters" do
        fill_in "Password", with: "123"
        click_button "Create User"
        expect(page).to have_content("Password is too short")
      end
      
      scenario "a unique username" do
        create_user
        logout
          visit "/users/new"
        fill_in "Username", with: "Username123"
        fill_in "Password", with: "Password456"
        click_button "Create User"
        expect(page).to have_content("Username has already been taken")
      end
  end
    
  scenario "has successful  Sign up" do
    fill_in "Username", with: "Username123"
    fill_in "Password", with: "Password123"
    click_button "Create User"
    expect(page).to have_content("Username123")   
  end

end

feature "Logging in:" do 
  before :each do
    create_user
    logout
    visit "/session/new"
  end
  
  feature "requires" do 
    scenario "to show error messages for invalid password" do
      fill_in "Username", with: "Username123"
      fill_in "Password", with: "Password456"
       click_button "Login"
       expect(page).to have_content('Invalid username or password')
    end
    
    scenario "to show error messages for invalid username" do
      fill_in "Username", with: "Username456"
      fill_in "Password", with: "Password123"
      click_button "Login"
      expect(page).to have_content('Invalid username or password')
    end
    
    scenario "that user can not log in" do
      fill_in "Username", with: "Username456"
      fill_in "Password", with: "Password123"
      click_button "Login"
      expect(page).to have_content('Login')
    end
      
  end  
  
  feature "has successful login and " do
    scenario "has a redirect to user's page" do
      expect(page).to have_content('Login')
      expect(page).to have_field('Username')
      expect(page).to have_field('Password')
    end

    scenario "shows username on the homepage after login" do
      fill_in "Username", with: "Username123"
      fill_in "Password", with: "Password123"
      click_button "Login"
      expect(page).to have_content('Username123')
    end
  end

end

# Logout
feature "Logging out: " do 
  before :each do
    create_user
    logout
  end
  
  scenario "begins with logged out state" do
    visit user_url(1)
    expect(page).to have_content('Login')
    
  end 
   
  scenario "doesn't show username on the homepage after logout" do
    visit user_url(1)
    expect(page).to_not have_content('Username123')
  end
end