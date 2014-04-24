class AddWidthAndHeightToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :width, :integer, limit: 2
    add_column :portfolios, :height, :integer, limit: 2
  end
end
