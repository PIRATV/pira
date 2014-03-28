module SiteHelper
  require 'uri'
  def check_active_page action
    return ' class=active' if action_name == action or request.fullpath.include? action or URI.decode_www_form_component(request.fullpath).include? action
    nil
  end

  def image_info image
    return false unless img_exists?(image)
    MiniMagick::Image.open(image_path("#{Rails.root}/app/assets/images/#{image}"))
  end

  def bbcodes text
    return '' if text.nil?
    %w(b i u p).map! {|reg| text.gsub! /\[(#{reg})\](.*?)\[\/\1\]/ui, '<\\1>\\2</\\1>' }
    text.gsub /\[br\]/i, '<br>'
  end
end
