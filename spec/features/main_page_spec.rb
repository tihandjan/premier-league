require 'rails_helper'

feature "main page" do
    
    scenario 'main page title' do
       visit '/'
       
       expect(page).to have_title('Английская премьер лига')
    end
    
end