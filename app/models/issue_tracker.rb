class IssueTracker < ActiveRecord::Base
  # include Tenacity
  
  belongs_to :issue
  
  def self.log_new_owner(issue, user)
    create!(:issue => issue, 
            :change => "New owner: #{user.name}", 
            :item_id => user.id,
            :item_type => 'User')
  end
  
  def self.load_issue_events(issue)
    IssueTracker.where("issue_id = ?", issue.id).order("updated_at")
  end
  
  def self.log_new_reply(reply)
    create!(:issue => reply.issue, 
            :change => "#{reply.user.name} has replied: #{reply.response}", 
            :item_id => reply.user.id,
            :item_type => 'Reply')
  end
end
