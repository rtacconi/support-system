class Admin::IssuesController < ApplicationController
  def index
    if params[:filter].nil?
      @issues = Issue.load_waiting()
    elsif params[:filter] == 'open_issues'
      @issues = Issue.open_issues()
    elsif params[:filter] == 'on_hold_issues'
      @issues = Issue.on_hold_issues()
    elsif params[:filter] == 'closed_issues'
      @issues = Issue.closed_issues()
    end
  end
  
  def edit
    begin
      @issue = Issue.find(params[:id])
      @statuses = Status.all.collect {|s| s.name}
      @its = IssueTracker.load_issue_events(@issue)
    rescue
      redirect_to admin_issues_url
    end
  end
  
  def make_owner
    @issue = Issue.find(params[:id])
    if @issue.present?
      @issue.user = current_user
      @issue.save
      # it should be moved in Issue model and called with after_save
      IssueTracker.log_new_owner(@issue, current_user) if @issue.user != current_user
    end
  end
  
  def change_status
    @issue = Issue.find(params[:id])
    @issue.status_id = params[:issue_status]
    @issue.save
  end
  
  def reply
    issue = Issue.find(params[:id])
    if issue.present?
      reply = Reply.create(:issue => issue,
                           :user => current_user,
                           :response => params[:response])
      flash['notice'] = 'Your reply has been sent'
    else
      flash['alert'] = 'Sorry, there was an error'
    end
    
    redirect_to edit_admin_issue_url(issue.id)
  end
end