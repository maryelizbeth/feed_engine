require 'spec_helper'

describe "API authentication ", :type => :api do
  let!(:user) { FactoryGirl.create(:user) }
  let(:url) { "http://api.example.com#{api_feed_path(user)}" }
  it "returns an error for a request with no token" do
    get "#{url}.json", :token => ""
    error = { :error => "Token is invalid." }
    last_response.body.should == (error.to_json)
  end
end
