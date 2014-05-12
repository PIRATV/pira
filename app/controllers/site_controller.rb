class SiteController < ApplicationController

  include ApplicationHelper

  before_action { add_breadcrumb I18n.t('Home'), :root_path }
  def index
  end

  def contact
    add_breadcrumb I18n.t('Contact'), create_url(:contact_path)
    @message = Message.new
  end

  def send_email_form
    @message = Message.new(params[:message])
    if @message.valid?
      @message.deliver
      redirect_to root_path, notice: I18n.t('Email successfully sent')
    else
      flash.now.alert = I18n.t('Please check your entries')
      render :contact
    end
  end

  def work
    add_breadcrumb I18n.t('Job'), create_url(:job_path)
  end

  def albums
    add_breadcrumb I18n.t('Portfolio'), create_url(:albums_path)
      @albums = Album.where(album_status: true)
      raise ActiveRecord::RecordNotFound if @albums.empty?
      render :albums
  end

  def portfolio
    if I18n.locale == :ru
      @album = (Album.find_by_album_url params[:album]) || (Album.find_by_album_id params[:album])
    else
      @album = (Album.find_by_en_album_url params[:album]) || (Album.find_by_album_id params[:album])
    end
    raise ActiveRecord::RecordNotFound if @album.nil?

    @portfolios = Portfolio.where(
        album_id: @album.album_id, status: true
    ).order(id: :desc).page(params[:page])
    #).paginate(
    #    page: params[:page], per_page: 15
    #)

    add_breadcrumb I18n.t('Portfolio'), create_url(I18n.t 'Portfolio')
    add_breadcrumb I18n.t(@album.album_name), create_url(I18n.locale == :ru ? @album.album_url : @album.en_album_url)
  end

  def camcorders
  end

  def thanks
    add_breadcrumb I18n.t('thanks'), create_url(I18n.t 'thanks')
  end

  def production
    add_breadcrumb I18n.t('Production'), create_url(I18n.t 'Production')

    @productions = ProductionCategory.all
    @category = params[:category] || 'Светодиодные_экраны'
    add_breadcrumb(@category.sub '_', ' ')
  end
  def language
    session[:language] = params[:language][0..1]
    set_language
    redirect_back_or_to root_path
  end
end
