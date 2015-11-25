require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
end

  context "user signed in on the homepage" do
    before do
      visit ('/')
      click_link('Sign up')
      fill_in('Email', with: 'text@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see a 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end

feature "User permissions" do
  context "user signed in and viewing restaurants" do
    it "can only edit restaurants which it has created" do
      user1_sign_up_and_sign_in
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      click_link('Sign out')
      user2_sign_up_and_sign_in
      click_link("Edit KFC")
      fill_in 'Name', with: 'Kentucy Fried Chicken'
      click_button('Update Restaurant')
      expect(page).to have_content("Cannot edit this restaurant")
    end
  end
end
