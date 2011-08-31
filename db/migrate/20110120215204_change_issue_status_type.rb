class ChangeIssueStatusType < ActiveRecord::Migration
  def self.up
    change_column :issues, :status, :integer
    rename_column :issues, :status, :status_id
  end

  def self.down
    change_column :issues, :status, :string
    rename_column :issues, :status_id, :status
  end
end
