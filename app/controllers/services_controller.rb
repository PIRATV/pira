class ServicesController < ApplicationController
  def led
  end

  def sites
  end

  def milling
    @images = %w(image41320131111110300992 image42020131111110300612 image55220131111110259167 image74920131111110300187 image81220131111110300991 image85320131111110300688)
  end

  def proj_film
    @videos = ['pds6i57ymHQ', 'bgIjqq2hal4', 'kRsD8bmAAqQ', 'xRKklpqkTB4']
  end
end
