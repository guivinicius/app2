require 'spec_helper'

describe "Emails" do
  describe "GET /emails" do
    it "it should redirect if an authenticated user is not present" do
      get emails_path
      response.status.should be(302)
    end
    
    it "should get success if user is loged in" do
      pending
    end
  end
end
