class Status < ActiveRecord::Base
  validates_uniqueness_of :name
  def self.init_statuses
    Status.create([{:name => 'Waiting for Staff Response'},
                   {:name => 'Waiting for Customer'},
                   {:name => 'On Hold'},
                   {:name => 'Cancelled'}, 
                   {:name =>'Completed'}])
  end
end
