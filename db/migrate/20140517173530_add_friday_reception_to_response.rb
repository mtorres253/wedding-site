class AddFridayReceptionToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :friday_reception, :boolean
  end
end
