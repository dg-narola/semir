require 'rails_helper'

RSpec.describe "Seminartopics", type: :request do
  describe "GET /seminartopics" do
    it "works! (now write some real specs)" do
      get seminartopics_path
      expect(response).to have_http_status(200)
    end
  end
end
