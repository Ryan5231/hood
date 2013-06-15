require "spec_helper"
require "rspec"

describe Listing do

  listing = FactoryGirl.build(:listing)
  let(:title) {"listing"}
  let(:wrong_title) {"Wrong title"}
  let(:description) {"description"}
  let(:wrong_description) {"wrong description"}
  let(:address) {"722 address st."}
  let(:wrong_address) {"711 address st."}
  let(:neighborhood_id) {1}
  let(:wrong_neighborhood_id) {2}
  let(:realtor_id) {1}
  let(:wrong_realtor_id) {2}

  describe "#creation of listing" do
    context "with valid input" do
      it "creates a new listing with correct title" do
        expect(listing.title).to eq title
      end

      it "does not create a listing with incorrect title" do
        expect(listing.title).not_to eq wrong_title
      end
      
      it "creates a new listing with correct description" do
        expect(listing.description).to eq description
      end

      it "does not create a listing with incorrect description" do
        expect(listing.description).not_to eq wrong_description
      end
      
      it "creates a new listing with correct address" do
        expect(listing.address).to eq address
      end

      it "does not create a listing with incorrect address" do
        expect(listing.address).not_to eq wrong_address
      end

      it "creates a new listing with correct neighborhood_id" do
        expect(listing.neighborhood_id).to eq neighborhood_id
      end

      it "does not create a listing with incorrect neighborhood_id" do
        expect(listing.neighborhood_id).not_to eq wrong_neighborhood_id
      end


      # it "does not create a listing with incorrect title" do
      #   expect(listing.title).not_to eq wrong_title
      # end
    end
  end
end