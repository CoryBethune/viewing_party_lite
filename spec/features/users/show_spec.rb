require 'rails_helper'

RSpec.describe 'Show', type: :feature do
  it "shows the user's information, 'Discover Movies button, and parties section" do
    user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')
    user_2 = User.create(name: 'Homer Simpson', email: 'Homer@gmail.com')

    visit "/users/#{user_1.id}"

    expect(page).to have_content("John Doe's Dashboard")
    expect(page).to have_no_content("Homer Simpson's Dashboard")
    expect(page).to have_button('Discover Movies')
    expect(page).to have_content('Viewing Parties')
  end

  it "clicks the 'Discover Movies' button and is taken to that user's 'Discover Movies' page" do
    user_1 = User.create(name: 'John Doe', email: 'John@gmail.com')
    user_2 = User.create(name: 'Homer Simpson', email: 'Homer@gmail.com')

    visit "/users/#{user_1.id}"

    click_button 'Discover Movies'

    expect(current_path).to eq("/users/#{user_1.id}/discover")
  end
end