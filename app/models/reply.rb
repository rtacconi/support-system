class Reply < ActiveRecord::Base
  # include Tenacity
  
  belongs_to :issue
  belongs_to :user
  after_save :log_new_reply
  
  private
    def log_new_reply
      IssueTracker.log_new_reply(self)
    end
end
