module ApplicationHelper
  def app_name
    I18n.t 'Advertising Information Company PIRA'
  end
  def page_title title=nil
    return app_name if title.nil? or title.empty?
    "#{app_name} - #{title}"
  end
  def home_url
    '/'
  end
  def url_suffix
    '.html'
  end

  def create_url url=nil
    return home_url if url.nil? or url.empty?
    url = home_url + url unless url.starts_with?(home_url)
    url += url_suffix unless url.ends_with?(url_suffix)
    url
  end
  def create_url *url
    return home_url if url.nil? or url.empty?
    url = url.join('/')
    url = home_url + url unless url.starts_with?(home_url)
    url = url + url_suffix unless url.ends_with?(url_suffix)
    url
  end

  def bootstrap_class_for flash_type
    {success: 'alert-success', error: 'alert-error', alert: 'alert-warning', notice: 'alert-info'}[flash_type] || flash_type.to_s
  end

  def theme_path
    "#{Rails.root}/app/themes/solution/"
  end

  def img_exists? image
    File.exist?(image_path("#{Rails.root}/app/assets/images/#{image}"))
  end

  def meta_tags keywords, description
    if keywords.blank? and description.blank?
      tag(:meta, name: 'keywords', value: 'реклама, наружная реклама, Пятигорск, КМВ, СКФО, ЮФО, баннеры, световые коробы, led, строки, экраны, объемные буквы, визитки, флайеры, печать, пленка') +
        "\n" +
        tag(:meta, name: 'description', value: 'Пятигорская Информационно-Рекламная компания ПИРА - Изготовление и размещение всех видов наружной и внутренней рекламы в городах СКФО и ЮФО')
    else
      tag(:meta, name: 'keywords', value: keywords) + "\n" + tag(:meta, name: 'description', value: description)
    end
  end
end
