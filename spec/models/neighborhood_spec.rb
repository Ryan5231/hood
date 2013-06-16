require "spec_helper"
require "rspec"

describe Neighborhood do

  neighborhood = FactoryGirl.build(:neighborhood)
  let(:neighborhood_name) {'Castro'}
  let(:wrong_neighborhood) {'not Castro'}

  describe "#creation of object" do
    context "with valid input" do
      it "creates a new neighborhood with correct neighborhood name" do
        expect(neighborhood.name).to eq neighborhood_name
      end
    end

    context "with invalid input" do
      it "does not create a neighborhood with incorrect neighborhood name" do
        expect(neighborhood.name).not_to eq wrong_neighborhood
      end
    end
  end
end