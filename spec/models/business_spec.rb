require "spec_helper"

describe Business do 

  it { should belong_to(:category) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:name) }

  describe "#rating" do
    let(:applebees) { Fabricate(:business) }
    it "returns '0' if there are not any reviews" do
      expect(applebees.rating).to eq(0)
    end

    it "returns the average rating if there is a reviews" do
      review1 = Fabricate(:review, business_id: applebees.id, rating: 1)
      expect(applebees.rating).to eq(review1.rating)
    end

    it "returns the average rating if there are many reviews" do
      review1 = Fabricate(:review, business_id: applebees.id, rating: 1)
      review2 = Fabricate(:review, business_id: applebees.id, rating: 2)
      review3 = Fabricate(:review, business_id: applebees.id, rating: 3)
      review4 = Fabricate(:review, business_id: applebees.id, rating: 4)
      review5 = Fabricate(:review, business_id: applebees.id, rating: 5)
      reviews = [review1, review2, review3, review4, review5]
      average = reviews.map(&:rating).reduce(:+) / reviews.length
      expect(applebees.rating).to eq(average)
    end

    it "returns the average with only one decimal point" do
      review1 = Fabricate(:review, business_id: applebees.id, rating: 4)
      review2 = Fabricate(:review, business_id: applebees.id, rating: 4)
      review3 = Fabricate(:review, business_id: applebees.id, rating: 5)
      reviews = [review1, review2, review3]
      average = reviews.map(&:rating).reduce(:+) / reviews.length
      expect(applebees.rating).to eq(average.round(2))

    end


  end


end