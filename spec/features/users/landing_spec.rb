require 'rails_helper'

RSpec.describe 'landing page' do

  it "can log in with valid credentials" do
    user = User.create(name: 'John', email: "funbucket13@gmail.com", password: "test")
    visit '/'

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq('/')

    expect(page).to have_content("Welcome, #{user.email}")
  end

it "cannot log in with bad credentials" do
  user = User.create(name: 'John', email: "funbucket13", password: "test")

  # we don't have to go through root_path and click the "I have an account" link any more
  visit login_path

  fill_in :email, with: user.email
  fill_in :password, with: "incorrect password"

  click_on "Log In"

  expect(current_path).to eq(login_path)

  expect(page).to have_content("Sorry, your credentials are bad.")
end

  it "displays the app title" do
    visit '/'
    expect(page).to have_content("Viewing Party Lite")
  end


  # it "has a list of existing users and links to their dashboards" do
  #   @user1 = User.create!(name: "Cory", email: '1@gmail.com', password: '12345')
  #   @user2 = User.create!(name: "John", email: '2@gmail.com', password: '12345')

  #   visit '/'

  #   within("div#user#{@user1.id}") do
  #     expect(page).to have_content("Cory")
  #     expect(page).to have_content("1@gmail.com")
  #     click_link('Cory')
  #     expect(current_path).to eq("/users/#{@user1.id}")
  #   end

  #   visit "/"

  #   within("div#user#{@user2.id}") do
  #     expect(page).to have_content("John")
  #     expect(page).to have_content("2@gmail.com")
  #     click_link('John')
  #     expect(current_path).to eq("/users/#{@user2.id}")
  #   end
  # end

  it "has a link to return to the landing page" do
    visit '/'

    click_link('Landing Page')

    expect(current_path).to eq('/')
  end

  it "logs in a user if user is not logged in" do
    user_1 = User.create!(name: "Cory", email: '1@gmail.com', password: '12345')

    visit '/'
    save_and_open_page

    
    click_on "I already have an account"

    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password

    click_on "Log In"

    expect(current_path).to eq('/')

    expect(page).to have_content("Welcome, #{user_1.email}")
  end

  it "logs in a user if user is not logged in" do
    user_1 = User.create!(name: "Cory", email: '1@gmail.com', password: '12345')

    visit '/'

    
    click_on "I already have an account"

    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password

    click_on "Log In"

    expect(current_path).to eq('/')

    expect(page).to have_content("Welcome, #{user_1.email}")
  end
end
