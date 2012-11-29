require 'spec_helper'

describe "Card pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a card" do
        expect { click_button "Post" }.not_to change(Card, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before do
        fill_in 'card_content', with: "Lorem ipsum" 
        fill_in 'card_subject', with: "Lorem ipsum"
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Card, :count).by(1)
      end
    end
  end
end