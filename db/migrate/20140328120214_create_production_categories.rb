class CreateProductionCategories < ActiveRecord::Migration
  def change
    create_table :production_categories do |t|
      t.string :category
      t.string :category_url
      t.references :parent

      t.timestamps
    end
  end
end
