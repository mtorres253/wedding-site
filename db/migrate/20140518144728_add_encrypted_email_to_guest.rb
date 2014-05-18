class AddEncryptedEmailToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :email_encrypted, :string
  end
end
