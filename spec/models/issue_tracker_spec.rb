require 'spec_helper'

describe IssueTracker do
  it "should log a new issue owner" do
    it_before = IssueTracker.count
    IssueTracker.log_new_owner(Issue.make!, User.make!)
    IssueTracker.count.should be > it_before
  end
  
  it "should load an issue event ordered by date" do
    issue = Issue.make!
    IssueTracker.log_new_owner(issue, User.make!)
    IssueTracker.load_issue_events(issue).count.should > 0
  end
end
