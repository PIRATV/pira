class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper :all
  helper_method :current_user_session, :current_user
  #filter_parameter_logging :password, :password_confirmation

  theme :theme_resolver

  rescue_from ActiveRecord::RecordNotFound, with: :page_not_found

  def page_not_found
    respond_to do |format|
      format.html { render file: 'errors/404', status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  private

  def theme_resolver
    params[:theme] ||= 'solution'
  end


  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def self.production
    {
        'Светодиодные_экраны' => {
            name: 'led_screens',
            title: 'Светодиодные экраны',
            types: {
                'ready-made' => 'Экраны «готовые решения»',
                'video-cityboard' => 'Видео-ситиборды',
                'video-cityformat' => 'Видео-ситиформаты',
                'video-fencing' => 'Видео-ограждения',
                'video-pillar' => 'Видео-пиллары',
                'videoboard' => 'Видеовывески',
                'fasad' => 'Фасадные решения',
                'interior' => 'Интерьерные экраны',
                'mediafacade' => 'Медиафасады',
                'big-screens' => 'Экраны «под ключ»',
                'arena' => 'Экраны-арена',
                'videodisplay' => 'Видеодисплей',
                'floor' => 'Напольные светодиодные экраны',
            }
        },
        'Рекламные_конструкции' => {
            name: 'advertisment',
            title: 'Рекламные конструкции',
            types: {
                'cityboard' => 'Ситиборды 2,7 × 3,7м',
                'flexboard' => 'Флексборды 2,7×3,7м',
                'scrollers_23x43' => 'Скроллеры 2,3 × 4,3 м',
                'scrollers_2x3' => 'Скроллеры 2 × 3 м',
                'billboards' => 'Рекламные щиты, билборды',
                'scrollers' => 'Роллерные дисплеи, скроллеры',
                'pillars' => 'Пиллары',
                'citybox' => 'Сити-боксы',
                'city-format' => 'Сити-форматы',
                'infostands' => 'Информационные стенды',
                'horeca' => 'ХоРеКа, панель-кронштейн',
                'light_fencing' => 'Световые рекламные ограждения',
                'scroller-arena' => 'Скроллеры «Арена»',
                'lightbox' => 'Световые короба, лайтбоксы',
                '3d_letters' => 'Объемные буквы'
            }
        },
        'Системы-конструкторы' => {
            name: 'diy',
            title: 'Системы-конструкторы',
            types: {
                'dss' => 'Цифровые роллерные системы',
                'busstop' => 'Остановочные павильоны',
                'light_fencing' => 'Световые ограждения',
                'flexboard' => 'Флексборд',
                'lightbox' => 'Световые короба',
                'cityformat' => 'Ситиформат',
                'binbox' => 'Бинбокс',
                'citybox' => 'Ситибокс',
                'pillars' => 'Пиллары'
            }
        },
        'Уличная_мебель' => {
            name: 'street_furniture',
            title: 'Уличная мебель',
            types: {
                'bench' => 'Рекламная скамейка',
                'busstop' => 'Остановочные павильоны',
                'binbox' => 'Рекламные урны, бин-боксы',
                'phone_booth' => 'Многофункциональная кабина',
                'beach_cabin' => 'Рекламная пляжная кабина',
                'bike_parking' => 'Велопарковка с лайтбоксом',
                'arbor' => 'Беседка рекламная'
            }
        }
    }
  end

end
