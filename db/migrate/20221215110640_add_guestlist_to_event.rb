class AddGuestlistToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :guestlist, :string, array: true, default: []
  end
end
