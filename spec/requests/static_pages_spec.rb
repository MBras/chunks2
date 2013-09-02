require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Chunks') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:chunk, user: user, description: "Lorem ipsum", status_id: 0)
        FactoryGirl.create(:chunk, user: user, description: "Dolor sit amet", status_id: 1, updated_at: 1.hour.ago)
        sign_in user
        visit root_path
      end

      it "should render the user's todo chunks" do
        user.todo_chunks.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.description)
        end
      end

      it "should render the user's recently closed chunks" do
        user.recently_closed_chunks.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.description)

          # check for strikethrough for these recently closed chunks

        end
      end
    end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('FAQ') }
    it { should have_title(full_title('FAQ')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
end