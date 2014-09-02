require 'rails_helper'
#CRUD
feature 'Goals:' do
  # todo: user logs in
  before :each do
    create_user
  end
  
  feature "create - "do
    before :each do
      visit "/goals"
    end

    scenario 'index has goal create link' do
      expect(page).to find_link('Create Goal').visible?
    end

    before :each do
      click_link('Create Goal')
    end

    feature "Should have form for" do
      scenario "body" do
        expect(page).to have_field('Body')
      end

      scenario "title" do
        expect(page).to have_field('Title')
      end

      scenario "permission flag" do
        expect(page).to have_field('Permission')
      end
    end

    feature "Should have form validation" do
      scenario "body" do
        fill_in_title
        check_private
        click_button('New Goal')
        expect(page).to have_content("Body can't be blank")
      end

      scenario "title" do
        fill_in_body
        check_private
        click_button('New Goal')
        expect(page).to have_content("Title can't be blank")
      end

    end

    scenario "after creating goal, redirected to goal show page" do
      create_a_goal
      expect(page).to have_content("Run a marathon")
      expect(page).to have_content("Get to the finish line")
    end
  end
  
  #todo: user creates goal
  feature 'read -' do
    before :each do
      create_a_goal
      visit "/goals/"
    end
    
    scenario 'index page has goal titles' do
      expect(page).to have_content("Run a marathon")
      expect(page).to find_link("Run a marathon").visible?
    end
      
    scenario 'show page has each element' do
      before :each do
        click_link("Run a marathon")
      end  
      
      # after create redirect to goal show page
      
      scenario "displays title" do
        expect(page).to have_content("Run a marathon")
        expect(page).to have_content("Get to the finish line")
        expect(page).to have_content("Private")
        expect(page).to have_content("In Progress")
      end      
    end  
  end
   
   feature 'update - ' do
     #todo user creates goal
     #clicks edit goal form
     scenario 'displays pre-filled goal information' do
       scenario "displays pre-filled goal body"
       scenario "displays pre-filled goal title"
       scenario "displays pre-filled goal permission"
       scenario "displays pre-filled goal status"
     end
     
     scenario "updates goals" do
       # before: changes goal title and goal body, permission, clicks button
       # redirect to each goal show page
       scenario "goal title, permission, status should be updated"
     end
   end
   
   feature 'delete -' do
     before :each do 
       create_a_goal
       visit "/goal/1"
     end
     
     scenario 'goal show page has delete button' do
       expect(page).to find_button('Delete Goal')
     end
     
     scenario 'user is redirected to goal index after goal is deleted' do
       click_button('Delete Goal')
       expect(page).to have_content("Index of Goals")
     end
     
     scenario 'goal will be deleted' do
       expect(page).to_not have_content("Run a marathon")
     end
   end 

   feature 'goals should be private' do
     before :each do
       create_a_goal
       logout 
       create_user2
       visit "/goal/1"
     end
     
     scenario "user2 can not see the user1's goal" do
       expect(page).to have_content("Permission denied")
     end
     
   end
end