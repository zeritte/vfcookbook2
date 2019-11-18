class SolutionFixes < ActiveRecord::Migration[5.2]
  def change
    remove_column :solutions, :description
    add_column :solutions, :footnote_en, :string
    add_column :solutions, :footnote_de, :string
  end
end
