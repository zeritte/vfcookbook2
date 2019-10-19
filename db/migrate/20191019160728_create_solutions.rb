class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.string :before_en
      t.string :after_en
      t.string :before_de
      t.string :after_de
      t.belongs_to :vf_case, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
