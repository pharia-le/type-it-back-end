class AddAccuracyToScore < ActiveRecord::Migration[6.0]
  def change
    add_column :scores, :accuracy, :integer
  end
end
