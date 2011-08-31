class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string :name
      t.string :email
      t.string :department
      t.string :subject
      t.string :body
      t.integer :reference_id
      t.integer :reply_id
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
