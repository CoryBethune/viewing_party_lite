require 'rails_helper'

RSpec.describe 'register page' do
  before(:each) do
    visit '/users/new'
  end

  it "registers a user, happy path" do
    name = "Happy"
    email = "happy@me.com"
    password = "test"

    fill_in :user_name, with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password
  
    click_on "Register"

    expect(page).to have_content("Welcome, #{email}!")
  
  end
    
  it "registers a user with no name, sad path" do
    email = "happy@me.com"
    password = "test"


    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password
  
    click_on "Register"
    expect(page).to have_content("Name can't be blank")
  end

  it "registers a user with another user's email, sad path" do
    name = "Happy"
    email = "happy@me.com"
    password = "test"

    fill_in :user_name, with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password
  
    click_on "Register"

    expect(page).to have_content("Welcome, #{email}!")

    visit '/users/new'
    
    name = "Semi Happy"
    email = "happy@me.com"
    password = "test"

    fill_in :user_name, with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password
  
    click_on "Register"

    expect(page).to have_content("Email has already been taken")
  end

  it "registers a user with incorrect password, sad path" do
    name = "Happy"
    email = "happy@me.com"
    password = "test"

    fill_in :user_name, with: name
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: 'test1'
  
    click_on "Register"
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
