class Message
  include ActiveAttr::Model
  include ActiveModel::Validations

  attribute :name
  attribute :email
  attribute :subject
  attribute :body

  attr_accessor :name, :email, :phone, :body

  validates_presence_of :name
  validates_presence_of :email
  validates :email, email_format: { message: I18n.t('Wrong email format')}
  validates_presence_of :phone
  validates_length_of :body, maximum: 500

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def deliver
    return false unless valid?
    Pony.mail({
                  :to => 'piratv@inbox.ru',
                  :from => %("#{name}" <#{email}>),
                  :reply_to => email,
                  :subject => subject,
                  :body => body,
                  :html_body => simple_format(body)
              })
  end

  def persisted?
    false
  end
end