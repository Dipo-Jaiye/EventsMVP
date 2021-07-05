class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :pay_status
      t.datetime :from
      t.datetime :to
      t.string :event_status

      t.timestamps
    end
  end
end
