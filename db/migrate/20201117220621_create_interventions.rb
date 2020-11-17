class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :customer_id
      t.integer :buidling_id
      t.integer :battery_id
      t.integer :column_id
      t.integer :elevator_id
      t.integer :employeeId
      t.date :start_date
      t.date :end_date
      t.string :result
      t.text :report
      t.string :status

      t.timestamps
    end
  end
end
