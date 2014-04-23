module ApplicationHelper
  def app_name
    'Рекламно-Информационная Компания ПИРА'
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
    "#{Rails.root}/app/themes/#{params[:theme]}/"
  end

  def img_exists? image
    File.exist? image_path("#{Rails.root}/app/assets/images/#{image}")
  end
end
