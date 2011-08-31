class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  has_many :issue_trackers
  before_save :set_status
  after_create :generate_ref
  
  validates_presence_of :name, :email, :subject, :body
  
  # it's not DRY but each query can be customized
  def self.load_waiting
    joins("LEFT OUTER JOIN statuses 
           ON statuses.name = 'Waiting for Staff Response'
           ORDER BY issues.updated_at")
  end
  
  def self.open_issues
    joins("LEFT OUTER JOIN statuses 
           ON statuses.name = 'Waiting for Customer'
           ORDER BY issues.updated_at")
  end
  
  def self.on_hold_issues
    joins("LEFT OUTER JOIN statuses 
           ON statuses.name = 'On Hold'
           ORDER BY issues.updated_at")
  end
  
  def self.closed_issues
    joins("LEFT OUTER JOIN statuses 
           ON statuses.name = 'Completed'
           ORDER BY issues.updated_at")
  end
  
  def self.cancelled_issues
    joins("LEFT OUTER JOIN statuses 
           ON statuses.name = 'Cancelled'
           ORDER BY issues.updated_at")
  end
  
  # reference is a composite key so ABC should come from somewhere
  # since I do not have any info to code the composite ID, I just create a dumb one
  def generate_ref
    self.reference = "ABC-#{id}"
    self.save
  end
  
  private
    def set_status
      self.status = Status.find_by_name('Waiting for Staff Response')
    end
    

end
