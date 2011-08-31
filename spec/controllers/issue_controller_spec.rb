require 'spec_helper'

describe IssueController do
  describe "GET 'index'" do
    it 'should display the index page' do
      get 'index'
      response.should be_success
      response.should render_template("issue/index")
    end
  end
  
  describe "POST create" do
    it "should create a new issue" do
      post 'create', :issue => {:name => 'Riccardo Tacconi', :email => 'rt@tin.com', 
                                :subject => 'Generic....', :body => 'Description of the issue...'}
      Issue.count.should > 0
    end
    
    it "should redirect to new issue" do
      post 'create'
      response.should redirect_to new_issue_url
    end
  end
end
