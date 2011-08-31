class CreateIssueTrackers < ActiveRecord::Migration
  def self.up
    create_table :issue_trackers do |t|
      t.integer :issue_id
      t.text :change
      t.integer :item_id
      t.string :item_type

      t.timestamps
    end
  end

  def self.down
    drop_table :issue_trackers
  end
end
