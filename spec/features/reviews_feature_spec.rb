require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "so so"
    select '3', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end

  # context 'deleting restaurants and their reviews' do
  #   it 'deletes reviews associated with deleted restaurant' do
  #     user1_sign_up_and_sign_in
  #     click_link 'Add a restaurant'
  #     fill_in 'Name', with: 'KFC'
  #     click_button 'Create Restaurant'
  #     visit '/restaurants'
  #     click_link 'Review KFC'
  #     fill_in "Thoughts", with: "so so"
  #     select '3', from: 'Rating'
  #     click_button 'Leave Review'
  #   # end
  #   #
  #   # scenario 'deleting a restaurant also deletes its reviews' do
  #     # expect(Review.count).to eq 1
  #     click_link 'Delete KFC'
  #     expect(Review.count).to eq 0
  #   # end
  #   end
  #   # before do
  #
end
