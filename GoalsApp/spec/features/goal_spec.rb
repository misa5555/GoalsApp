require 'rails_helper'
#CRUD
feature 'Goals:' do
  # todo: user logs in
  
  feature "create - "do
  #click_create button link
  feature "Should have form for" do
    feature "body"
    feature "title"
    feature "permission flag"    
    end
  
  
  end
  
  #todo: user creates goal
  feature 'read -' do
    feature "displayed on user's index"
    feature "displays body"
    feature "display title"
    feature "display permission"
    feature "displays status"
   end
   
   feature 'update - ' do
     #todo user creates goal
     #clicks edit goal form
     feature 'displays pre-filled goal information' do
       feature "displays pre-filled goal body"
       feature "displays pre-filled goal title"
       feature "displays pre-filled goal permission"
       feature "displays pre-filled goal status"
     end
     
     feature "updates goals" do
       # before: changes goal title and goal body, permission, clicks button
       # redirect to user index
       feature ""
       
       
     end
     
     
   end 
end