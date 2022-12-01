class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :attachment, null: false, foreign_key: true

      t.timestamps
    end

    add_index :likes, [:user_id, :attachment_id], unique: true
  end
end
