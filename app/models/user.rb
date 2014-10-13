class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :posts
  has_many :comments

  has_many :portfolios


  before_create :generate_unique_user
  after_create :auto_create_subdomain


  def auto_create_subdomain
    subdomain = self.username.gsub(/[.]/, '')
    self.subdomain = subdomain
    self.save!
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.gender = auth.info.gender
      user.image = auth.info.image
    end
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def generate_unique_user
    if self.username.blank?
      username = self.email.split("@").first
      username = username.downcase
      #new_username = username.dup
      self.username = unique_username(username)
    end
  end

  def unique_username(username)
    num = 1
    new_username = username
    p new_username
    user = User.where(:username => 'er.ahmad.hassan').first
    p user
    p User.find_by_username(new_username)
    while User.where(username: new_username).first  do
      num +=1
      new_username = "#{username}#{num}"
      p "New Username= #{new_username}"
    end
    return new_username
  end

>>>>>>> e2c0a56e0437c90101347be88b53bfd001725ac9
end
