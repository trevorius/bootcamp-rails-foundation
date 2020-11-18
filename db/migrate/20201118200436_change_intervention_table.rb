class ChangeInterventionTable < ActiveRecord::Migration[5.2]
  def up
    remove_column :interventions, :customer_id
    remove_column :interventions, :buidling_id
    remove_column :interventions, :employeeId
    add_reference :interventions, :customer
    add_reference :interventions, :building
    add_reference :interventions, :employee

  end
  def down
   rename_column :interventions, :employee_id, :employeeId


   change_column :interventions, :customer_id, :integer
   change_column :interventions, :building_id, :integer
   change_column :interventions, :employeeId, :integer

   rename_column :interventions, :building_id, :buidling_id


  end
end

