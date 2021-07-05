class RemoveAccountNumberFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :account_number, :numeric
  end
end
