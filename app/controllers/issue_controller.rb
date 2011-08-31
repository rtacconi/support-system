class IssueController < ApplicationController
  def index
  end
  
  def create
    issue = Issue.new(params[:issue])
    if issue.save
      flash['notice'] = 'Your issue has been logged by the system'
    else
      flash['alert'] = 'Please, fill all required fields'
    end
    
    redirect_to new_issue_url
  end
end
