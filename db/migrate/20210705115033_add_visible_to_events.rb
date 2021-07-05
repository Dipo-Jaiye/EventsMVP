class AddVisibleToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :visible, :string
  end
end
