class AddSpotIdToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :spot_id, :integer
  end
end
