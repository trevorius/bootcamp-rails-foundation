class AddReferencesToInterventions < ActiveRecord::Migration[5.2]
  def up
    remove_column :interventions, :battery_id
    remove_column :interventions, :column_id
    remove_column :interventions, :elevator_id
    add_reference :interventions, :battery
    add_reference :interventions, :column
    add_reference :interventions, :elevator

  end
  def down
    change_column :interventions, :battery_id, :integer
    change_column :interventions, :column_id, :integer
    change_column :interventions, :elevator_id, :integer
   end
end
