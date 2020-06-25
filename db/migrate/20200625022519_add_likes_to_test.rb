class AddLikesToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :likes, :integer, default: 0
    add_column :tests, :author, :string
  end
end
