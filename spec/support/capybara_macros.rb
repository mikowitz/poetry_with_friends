module CapybaraMacros
  def sign_in(user, password='password')
    email = user.instance_of?(User) ? user.email : user
    Capybara.reset_sessions!
    visit '/'
    within('#new_user') do
      fill_in 'Email', with: email
      fill_in 'Password', with: password
    end
    click_button 'Sign in'
  end
end
