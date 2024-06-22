class AddPlaceToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :place, :string
  end
end
