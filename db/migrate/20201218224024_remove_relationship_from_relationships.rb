class RemoveRelationshipFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :foloower_id, :integer
    remove_column :relationships, :followed_id, :integer
  end
end
