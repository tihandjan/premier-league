class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  mount_uploader :avatar, AvatarUploader
  
  
  
  # facebook
  def self.find_for_facebook_oauth access_token
    
    if self.where(email: access_token.info.email).exists?
      user = self.where(email: access_token.info.email).first
      user.provider = access_token.provider
      user.uid = access_token.uid
      user.avatarc = access_token.info.image
    else
      user = self.create do |user|
         user.provider = access_token.provider
         user.uid = access_token.uid
         user.username = access_token.extra.raw_info.name
         user.email = access_token.extra.raw_info.email
         user.avatarc = access_token.info.image
         user.password = Devise.friendly_token[0,20]
      end
    end
    user
  end
  
  # google
  def self.find_for_google_oauth auth
    
    if self.where(email: auth.info.email).exists?
      user = self.where(email: auth.info.email).first
      user.provider = auth.provider
      user.uid = auth.uid
      user.avatarc = auth.info.image
    else
      user = self.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.avatarc = auth.info.image
        user.username = auth.extra.raw_info.name
        user.password = Devise.friendly_token[0,20]
      end
    end
    user
  end
  
  
end
