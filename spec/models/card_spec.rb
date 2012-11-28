require 'spec_helper'

describe Card do

  let(:user) { FactoryGirl.create(:user) }
  before { @card = user.cards.build(subject: "Lorem ipsum", content: "Lorem ipsum") }
  

  subject { @card }

  it { should respond_to(:content) }
  it { should respond_to(:subject) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @card.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Card.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
end
