class AlterColumnsinUser < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true
    change_table :users do |t|
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.index :persistence_token, unique: true
    end
  end
end
