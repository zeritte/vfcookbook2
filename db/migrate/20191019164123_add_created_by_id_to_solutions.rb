class AddCreatedByIdToSolutions < ActiveRecord::Migration[5.2]
  def change
    add_column :solutions, :created_by_id, :integer
  end
end
