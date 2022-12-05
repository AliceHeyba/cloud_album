class AddQrCodeToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :qr_code, :string
  end
end
