require_relative '../spec_helper'

describe Tramtracker::API do

  before do
    @tramtracker = Tramtracker::API.new(1111)
    @mock_response = File.read("spec/fixtures/tramtracker.json")
  end

  describe ".get" do
    it "returns an array of hashes with route and time data" do
      @tramtracker.stub :open, OpenStruct.new({:read => @mock_response}) do
        @tramtracker.get.must_include({route: "64", minutes: 4})
        @tramtracker.get.must_include({route: "64", minutes: 25})
        @tramtracker.get.must_include({route: "64", minutes: 391})
      end
    end
  end

end
