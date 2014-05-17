class AddGuestIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :guest_id, :integer
  end
end
