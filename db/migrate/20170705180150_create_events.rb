class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :topic
      t.datetime :start_date
      t.datetime :end_date
      t.string :city

      t.timestamps
    end
  end
end
