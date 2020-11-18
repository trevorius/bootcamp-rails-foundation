class AddAuthorToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :author, :integer
  end
end
