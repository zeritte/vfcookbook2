class CreateVfCases < ActiveRecord::Migration[5.2]
  def change
    create_table :vf_cases do |t|
      t.string :name
      t.string :case_class
      t.boolean :is_active
      t.belongs_to :domain, foreign_key: true
      t.belongs_to :impact, foreign_key: true
      t.belongs_to :tctype, foreign_key: true

      t.timestamps
    end
  end
end
