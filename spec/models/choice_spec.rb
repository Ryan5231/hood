require "spec_helper"
require "rspec"

describe Choice do

  choice = FactoryGirl.build(:choice)
  let(:content) {"content"}
  let(:wrong_content) {"Wrong content"}
  let(:neighbor_id) {1}
  let(:wrong_neighbor_id) {2}
  let(:listing_id) {1}
  let(:wrong_listing_id) {2}
  

  describe "#creation of choice" do
    context "with valid input" do
      it "creates a new choice with correct content" do
        expect(choice.content).to eq content
      end

      it "does not create a choice with incorrect content" do
        expect(choice.content).not_to eq wrong_content
      end
      
      it "creates a new choice with correct neighbor_id" do
        expect(choice.neighbor_id).to eq neighbor_id
      end

      it "does not create a choice with incorrect neighbor_id" do
        expect(choice.neighbor_id).not_to eq wrong_neighbor_id
      end
      
      it "creates a new choice with correct listing_id" do
        expect(choice.listing_id).to eq listing_id
      end

      it "does not create a choice with incorrect listing_id" do
        expect(choice.listing_id).not_to eq wrong_listing_id
      end
    end
  end
end


