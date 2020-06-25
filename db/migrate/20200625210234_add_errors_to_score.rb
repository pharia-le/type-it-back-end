class AddErrorsToScore < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :errors_count, :integer
  end
end
