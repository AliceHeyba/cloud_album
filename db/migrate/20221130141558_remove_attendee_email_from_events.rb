class RemoveAttendeeEmailFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :attendee_email, :string
  end
end
