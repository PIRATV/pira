class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper :all
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
