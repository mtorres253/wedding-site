class AddDepartureCityToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :departure_city, :string
  end
end
