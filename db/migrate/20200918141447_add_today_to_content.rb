class AddTodayToContent < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :today, :string
  end
end
