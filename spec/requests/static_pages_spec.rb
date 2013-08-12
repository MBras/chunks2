require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "Chunks" }

	describe "Home page" do

		it "should have the content 'Chunks'" do
			visit '/static_pages/home'
			expect(page).to have_content('Chunks')
		end

		it "should have the right title" do
			visit '/static_pages/home'
			expect(page).to have_title("#{base_title}")
		end

		it "should not have a custom page title" do
			visit '/static_pages/home'
			expect(page).not_to have_title('| Home')
		end
	end

	describe "Help page" do

		it "should have the content 'Chunks'" do
			visit '/static_pages/help'
			expect(page).to have_content('FAQ')
		end

		it "should have the right title" do
			visit '/static_pages/help'
			expect(page).to have_title("#{base_title} | FAQ")
		end
	end

	describe "About page" do

		it "should have the content 'About Chunks'" do
			visit '/static_pages/about'
			expect(page).to have_content('About us')
		end

		it "should have the right title" do
			visit '/static_pages/about'
			expect(page).to have_title("#{base_title} | About us")
		end
	end
end