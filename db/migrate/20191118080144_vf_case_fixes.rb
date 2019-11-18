class VfCaseFixes < ActiveRecord::Migration[5.2]
  def change
    add_column :vf_cases, :documentation, :text
    add_column :vf_cases, :content_en, :string
    add_column :vf_cases, :content_de, :string
    add_column :vf_cases, :case_id, :text
  end
end
