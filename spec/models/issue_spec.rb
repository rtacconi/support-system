require 'spec_helper'

describe Issue do
  describe "when an issue is created" do
    it "should set status to Waiting for Staff Response on update" do
      Status.init_statuses
      issue = Issue.make!
      issue.status.name.should == "Waiting for Staff Response"
    end
    
    it "should generate a reference" do
      issue = Issue.make!
      issue.reference.should == "ABC-#{issue.id}"
    end
  
    it "should send an email"
  end
  
  describe "custom queries" do
    it "should load awaiting issues" do
      Status.init_statuses
      Issue.make!
      issues = Issue.load_waiting()
      issues.count.should > 2
    end
  end
end
