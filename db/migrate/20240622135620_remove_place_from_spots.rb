class RemovePlaceFromSpots < ActiveRecord::Migration[6.1]
  def change
    remove_column :spots, :place, :string
  end
end
