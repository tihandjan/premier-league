require 'rails_helper'

feature 'main page' do
    
    scenario 'main page have title' do
       visit '/'
       
       expect(page).to have_title('Английская премьер лига')
    end
    
    scenario 'user can sign_up' do
       visit root_path
       click_on 'Регистрация'
       click_on 'Зарегистрироваться вручную'
       
       fill_in 'user_username', with: 'Testname'
       fill_in 'user_email', with: 'test@mail.com'
       fill_in 'user_password', with: 'password'
       fill_in 'user_password_confirmation', with: 'password'
       
       click_on 'Зарегистрироваться'
       
       expect(current_path).to eq root_path
       expect(page).to have_content('Добро пожаловать! Вы успешно зарегистрировались.')
    end
    
    scenario 'registered user can sign in' do
       User.create!(email: 'test@mail.com', password: 'password')
       visit root_path 
       click_on 'Войти'
       click_on 'Войти вручную'
       
       fill_in 'user_email', with: 'test@mail.com'
       fill_in 'user_password', with: 'password'
       find('input[name="commit"]').click
       
       expect(current_path).to eq root_path
       expect(page).to have_content('Вход в систему выполнен.')
    end
    
end