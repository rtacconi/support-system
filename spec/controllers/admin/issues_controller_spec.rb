require 'spec_helper'

describe Admin::IssuesController do
  include Devise::TestHelpers
  
  describe "GET index" do
    before(:each) do
      sign_in User.make!
    end
    
    it "should call 'New unassigned issues' when filter is nil" do
      Issue.should_receive(:load_waiting) {}
      get 'index', :filter => nil
    end
    
    it "should call 'new_unassigned_issues'" do
      Issue.should_receive(:load_waiting) {}
      get 'index', :filter => 'new_unassigned_issues'
    end
    
    it "should call 'open_issues'" do
      Issue.should_receive(:open_issues) {}
      get 'index', :filter => 'open_issues'
    end
    
    it "should call 'on_hold_issues'" do
      Issue.should_receive(:on_hold_issues) {}
      get 'index', :filter => 'on_hold_issues'
    end
    
    it "should call 'closed_issues'" do
      Issue.should_receive(:closed_issues) {}
      get 'index', :filter => 'closed_issues'
    end
  end
  
  
  describe "GET edit" do
    it "should be a success with exesting ID" do
      issue = Issue.make!
      get 'edit', :id => issue.id
      response.should be_success
    end
    
    it "should redirect with wrong ID" do
      issue = Issue.make!
      get 'edit', :id => 13432
      response.should redirect_to(admin_issues_url)
    end
  end
end
