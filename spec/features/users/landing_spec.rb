require 'rails_helper'

RSpec.describe 'landing page' do
  # before(:each) do
  #   @user1 = User.create!(name: "Cory", email: '1@gmail.com')
  #   @user2 = User.create!(name: "John", email: '2@gmail.com')

  #   visit '/'
  # end

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

  xit "displays the app title" do
    expect(page).to have_content("Viewing Party Lite")
  end

  xit "has a button to create a new user" do
    click_link('Create New User')
    expect(current_path).to eq('/register')
  end

  xit "has a list of existing users and links to their dashboards" do
    within("div#user#{@user1.id}") do
      expect(page).to have_content("Cory")
      expect(page).to have_content("1@gmail.com")
      click_link('Cory')
      expect(current_path).to eq("/users/#{@user1.id}")
    end

    visit "/"
    within("div#user#{@user2.id}") do
      expect(page).to have_content("John")
      expect(page).to have_content("2@gmail.com")
      click_link('John')
      expect(current_path).to eq("/users/#{@user2.id}")
    end
  end

  xit "has a link to return to the landing page" do
    click_link('Landing Page')
    expect(current_path).to eq('/')
  end
end
