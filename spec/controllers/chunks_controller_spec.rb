require 'spec_helper'

describe ChunksController do
	describe "POST #event" do
		let(:user) { FactoryGirl.create(:user) }
		describe "as right user" do
			before do
      			sign_in(user, no_capybara: true)
				@chunk1 = FactoryGirl.create(:chunk, status_id: 0)
				get :event, id: @chunk1, event_id: "0"
			end

			it "redirects to the root page" do
				expect(response).to redirect_to(root_url)
			end

			it "update the chunk status" do
				expect(@chunk1.status_id).to eq(1)
			end
		end

		describe "as wrong user" do
			let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      		before do
      			@chunk2 = FactoryGirl.create(:chunk, user_id: user.id, status_id: 0)
				sign_in(wrong_user, no_capybara: true)
				get :event, id: @chunk2, event_id: "0"
			end

			it "shouldn't update the chunk status" do
				expect(@chunk2.status_id).to eq(0)
			end
			it "redirects to the root page" do
				expect(response).to redirect_to(root_url)
			end
			it "shows an error message" do
				flash[:warning].should eql('Wrong user')
			end
		end
	end
end