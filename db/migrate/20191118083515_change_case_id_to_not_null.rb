class ChangeCaseIdToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :vf_cases, :case_id, :text, null: false
  end
end
