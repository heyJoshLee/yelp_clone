require "spec_helper"

describe Review do
  describe "#recent_reviews" do
    it "returns an array" do
      expect(Review.recent_reviews).to eq([])
    end

    it "returns 1 review when there is only one review" do 
      review1 = Fabricate(:review, created_at: 1.day.ago)
      expect(Review.recent_reviews).to match_array([review1])
    end

    it "returns 10 reviews when there are 10 reviews" do
      review1 = Fabricate(:review, created_at: 1.day.ago)
      review2 = Fabricate(:review, created_at: 2.days.ago)
      review3 = Fabricate(:review, created_at: 3.days.ago)
      review4 = Fabricate(:review, created_at: 4.days.ago)
      review5 = Fabricate(:review, created_at: 5.days.ago)
      review6 = Fabricate(:review, created_at: 6.days.ago)
      review7 = Fabricate(:review, created_at: 7.days.ago)
      review8 = Fabricate(:review, created_at: 8.days.ago)
      review9 = Fabricate(:review, created_at: 9.days.ago)
      review10 = Fabricate(:review, created_at: 10.days.ago)
      expect(Review.recent_reviews).to match([review1, review2, review3, review4,
                                    review5, review6, review7,
                                    review8, review9, review10])
    end

    it "returns 10 reviews when there are more than 10 reviews" do
      review1 = Fabricate(:review, created_at: 1.day.ago)
      review2 = Fabricate(:review, created_at: 2.days.ago)
      review3 = Fabricate(:review, created_at: 3.days.ago)
      review4 = Fabricate(:review, created_at: 4.days.ago)
      review5 = Fabricate(:review, created_at: 5.days.ago)
      review6 = Fabricate(:review, created_at: 6.days.ago)
      review7 = Fabricate(:review, created_at: 7.days.ago)
      review8 = Fabricate(:review, created_at: 8.days.ago)
      review9 = Fabricate(:review, created_at: 9.days.ago)
      review10 = Fabricate(:review, created_at: 10.days.ago)
      review11 = Fabricate(:review, created_at: 11.days.ago)
      expect(Review.recent_reviews).to match([review1, review2, review3, review4,
                                    review5, review6, review7,
                                    review8, review9, review10])
    end
  end

end