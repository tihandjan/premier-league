require 'rails_helper'

feature "main page" do
    
    scenario 'main page have title' do
       visit '/'
       
       expect(page).to have_title('Английская премьер лига')
    end
    
end