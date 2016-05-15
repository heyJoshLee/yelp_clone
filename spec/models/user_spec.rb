require "spec_helper"


describe User do
  it { should have_many(:reviews) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }

  describe "#has_reviewed?" do
    let(:user) { Fabricate(:user) }
    let(:category) { Fabricate(:category) }
    let(:business) { Fabricate(:business, category: category) }

    it "returns false if the user has not reviewed the video" do
      expect(user.has_reviewed?(business)).to be_falsey
    end

    it "returns true if the user has reviewed the video" do
      review = Fabricate(:review, user_id: user.id, business_id: business.id)
      expect(User.first.has_reviewed?(business)).to be_truthy
    end
  end
end