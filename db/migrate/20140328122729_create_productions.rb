class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.text :text
      t.boolean :status
      t.belongs_to :production_category

      t.timestamps
    end
  end
end
