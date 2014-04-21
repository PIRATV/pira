class ProductionCategory < ActiveRecord::Base
  has_many :subcategories, class_name: 'ProductionCategory', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent_category, class_name: 'ProductionCategory'
end
