class ProductionController < ApplicationController
  include ApplicationHelper

  add_breadcrumb I18n.t('Home'), :root_path

  def show
    regexp = ''
    arr = ApplicationController.production[params[:category]]

    raise ActiveRecord::RecordNotFound if arr.nil?

    arr[:types].each {|name, title| regexp += Regexp.escape(name)+'|'}

    raise ActiveRecord::RecordNotFound unless params[:type] =~ /\A(?:#{regexp[0..-2]})\Z/i

    @title = arr[:title]
    @category = arr[:name]
    @action = arr[:types][params[:type]]

    add_breadcrumb I18n.t('Production'), create_url(I18n.t 'Production')
    add_breadcrumb @title, create_url(I18n.t('Production'), params[:category])
    add_breadcrumb @action, create_url(I18n.t 'Production')

    render 'production'
  end

end
