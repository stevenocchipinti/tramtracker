require_relative '../spec_helper'

describe Tramtracker do

  before do
    @tramtracker = Tramtracker.new(1725)
    @mock_response = <<-EOS
      ID: 1725<br>\r\n
      1) Rte 100<br>\r\n1 mins *<br>\r\n
      2) Rte 101<br>\r\n10 mins *!<br>\r\n
      3) Rte 102<br>\r\n20 mins *!<br>"
    EOS
  end

  describe ".get" do
    it "returns an array of hashes with route and time data" do
      @tramtracker.stub :open, OpenStruct.new({:read => @mock_response}) do
        @tramtracker.get.must_include({route: "100", minutes: "1"})
        @tramtracker.get.must_include({route: "101", minutes: "10"})
        @tramtracker.get.must_include({route: "102", minutes: "20"})
      end
    end
  end

end
