class ServicesController < ApplicationController

  before_action { add_breadcrumb I18n.t('Home'), :root_path }

  def led
    add_breadcrumb I18n.t('LedScreens')
  end

  def sites
    add_breadcrumb I18n.t('Sites')
  end

  def milling
    add_breadcrumb I18n.t('milling')
    @images = %w(image41320131111110300992 image42020131111110300612 image55220131111110259167 image74920131111110300187 image81220131111110300991 image85320131111110300688)
  end

  def proj_film
    add_breadcrumb I18n.t('ProjectionFilm')
    @videos = ['pds6i57ymHQ', 'bgIjqq2hal4', 'kRsD8bmAAqQ', 'xRKklpqkTB4']
  end

  def special_orders
    @images = %w(gibdd_1 gibdd_2)
    @videos = [] #unless video isn't uploaded
    add_breadcrumb I18n.t('special_orders')
  end

  def advert_led
  end
end
