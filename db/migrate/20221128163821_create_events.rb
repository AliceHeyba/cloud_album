class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :event_date
      t.string :event_name
      t.text :event_description
      t.string :attendee_email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
