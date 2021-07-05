class CreateUserSessionModel < ActiveRecord::Migration[6.1]
  def change
    create_table :user_session do |t|

      t.timestamps
    end
  end
end
