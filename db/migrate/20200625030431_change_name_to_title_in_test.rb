class ChangeNameToTitleInTest < ActiveRecord::Migration[6.0]
  def change
    rename_column :tests, :name, :title
  end
end
