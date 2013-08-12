require 'spec_helper'

describe "Home page" do

  it "should have the content 'Chunks'" do
    visit '/static_pages/home'
    expect(page).to have_content('Chunks')
  end
	
	it "should have the right title" do
	  visit '/static_pages/home'
	  expect(page).to have_title("Chunks | Home")
	end
end

describe "Help page" do

  it "should have the content 'Chunks'" do
    visit '/static_pages/help'
    expect(page).to have_content('FAQ')
  end

	it "should have the right title" do
	  visit '/static_pages/help'
	  expect(page).to have_title("Chunks | FAQ")
	end
end

describe "About page" do

  it "should have the content 'About Chunks'" do
    visit '/static_pages/about'
    expect(page).to have_content('About Chunks')
  end

	it "should have the right title" do
	  visit '/static_pages/about'
	  expect(page).to have_title("Chunks | About us")
	end
end