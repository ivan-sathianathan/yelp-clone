def user1_sign_up_and_sign_in
  visit ('/')
  click_link('Sign up')
  fill_in('Email', with: 'text1@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def user2_sign_up_and_sign_in
  visit ('/')
  click_link('Sign up')
  fill_in('Email', with: 'text2@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
