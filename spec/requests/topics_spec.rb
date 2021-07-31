require 'rails_helper'

RSpec.describe "/topics", type: :request do
  
  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # TopicsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      get topics_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end
end
