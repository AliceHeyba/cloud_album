class AddMetaCreationToAttachments < ActiveRecord::Migration[7.0]
  def change
    add_column :attachments, :meta_creation, :jsonb
  end
end
