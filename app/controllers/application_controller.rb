class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper :all
  #filter_parameter_logging :password, :password_confirmation

  before_filter :set_language
  before_action :set_layout

  theme :theme_resolver

  rescue_from ActiveRecord::RecordNotFound, with: :page_not_found

  def page_not_found
    respond_to do |format|
      format.html { render file: 'errors/404', status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def not_authenticated
    redirect_to '/', alert: 'Недостаточно прав для просмотра страницы'
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', alert: exception.message
  end

  private

  def theme_resolver
    'solution'
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def set_language
    if session[:language].blank? or session[:language].to_sym != I18n.locale
      session[:language] = 'ru' if session[:language].blank?
      session[:language] = (['ru', 'en'].include? session[:language]) ? session[:language] : 'ru'
      I18n.locale =  session[:language].to_sym
    end
  end

  def set_layout
    layout = "#{I18n.locale}/#{layout}"
  end

end
