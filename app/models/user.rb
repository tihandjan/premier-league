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
  
  
  
  
end
