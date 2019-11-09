class AddIsApprovedToSolutions < ActiveRecord::Migration[5.2]
  def change
    add_column :solutions, :is_approved, :boolean, default: false
  end
end
