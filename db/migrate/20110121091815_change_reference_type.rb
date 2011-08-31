class ChangeReferenceType < ActiveRecord::Migration
  def self.up
    change_column :issues, :reference_id, :string
    rename_column :issues, :reference_id, :reference
  end

  def self.down
    change_column :issues, :reference_id, :integer
    rename_column :issues, :reference, :reference_id
  end
end
