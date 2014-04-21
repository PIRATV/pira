class ProductionController < ApplicationController
  include ApplicationHelper

  add_breadcrumb I18n.t('Home'), :root_path

  def show
    @category = ProductionCategory.find_by_category_url params[:type]
    raise ActiveRecord::RecordNotFound if @category.nil?
    @production = Production.find_by_production_category_id @category.id
    raise ActiveRecord::RecordNotFound if @production.nil?
    add_breadcrumb I18n.t('Production'), create_url(I18n.t 'Production')
    add_breadcrumb params[:category], create_url(I18n.t('Production'), params[:category])
    add_breadcrumb @category.category
    render 'production'
  end

end
