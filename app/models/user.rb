class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  mount_uploader :avatar, AvatarUploader
  
  
  
  # facebook
  def self.find_for_facebook_oauth access_token
    if user = User.where(:uid =>  access_token.uid, :provider => access_token.provider).first
      user
    else 
      User.create!(:provider => access_token.provider, :uid =>  access_token.uid, :avatarc => access_token.info.image, :username => access_token.extra.raw_info.name, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20]) 
    end
  end
  
  # google
  def self.find_for_google_oauth auth
    
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.avatarc = auth.info.image
      user.username = auth.extra.raw_info.name
      user.password = Devise.friendly_token[0,20]
    end
    
  end
  
  
end
