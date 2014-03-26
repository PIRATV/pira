class SiteController < ApplicationController

  include ApplicationHelper

  add_breadcrumb I18n.t('Home'), :root_path
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
    @album = (Album.find_by_album_url params[:album]) || (Album.find_by_album_id params[:album])
    raise ActiveRecord::RecordNotFound if @album.nil?

    @portfolios = Portfolio.where(
        album_id: @album.album_id, status: true
    ).paginate(
        page: params[:page], per_page: 10
    )

    add_breadcrumb I18n.t('Portfolio'), create_url(I18n.t 'Portfolio')
    add_breadcrumb @album.album_name, create_url(@album.album_url)

    render :photos
  end

  def production
    add_breadcrumb I18n.t('Production'), create_url(I18n.t 'Production')

    @productions = ApplicationController.production
    @category = params[:category] || 'Светодиодные_экраны'
    add_breadcrumb(@category.sub '_', ' ')
  end
end
