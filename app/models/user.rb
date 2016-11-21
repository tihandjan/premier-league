class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  mount_uploader :avatar, AvatarUploader
  
  
  
  # facebook
  def self.find_for_facebook_oauth access_token
    if  access_token.info.email.blank?
      if self.where(provider: auth.provider, uid: auth.uid).exists?
        user = self.where(provider: auth.provider, uid: auth.uid).first
        user.provider = auth.provider
        user.uid = auth.uid
        user.avatarc = auth.info.image
      else
        user = self.create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.email = "autogenerated@email#{User.last.blank? ? 'autogenerated@email0.com' : User.last.id}"
          user.avatarc = auth.info.image
          user.username = auth.extra.raw_info.name
          user.password = Devise.friendly_token[0,20]
        end
      end
      user
    else
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
        user.email = access_token.info.email
        user.avatarc = access_token.info.image
        user.password = Devise.friendly_token[0,20]
        end
      end  
      user
    end
  end
  
  # google
  def self.find_for_google_oauth auth
    if  auth.info.email.blank?
      if self.where(provider: auth.provider, uid: auth.uid).exists?
        user = self.where(provider: auth.provider, uid: auth.uid).first
        user.provider = auth.provider
        user.uid = auth.uid
        user.avatarc = auth.info.image
      else
        user = self.create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.email = "autogenerated@email#{User.last.blank? ? 'autogenerated@email0.com' : User.last.id}"
          user.avatarc = auth.info.image
          user.username = auth.extra.raw_info.name
          user.password = Devise.friendly_token[0,20]
        end
      end
      user
    else
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
        user.email = access_token.info.email
        user.avatarc = access_token.info.image
        user.password = Devise.friendly_token[0,20]
        end
      end  
      user
    end
  end

  # twitter
  def self.find_for_twitter_oauth auth
    
    if self.where(provider: auth.provider, uid: auth.uid).exists?
      user = self.where(provider: auth.provider, uid: auth.uid).first
      user.provider = auth.provider
      user.uid = auth.uid
      user.avatarc = auth.info.image
    else
      user = self.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = "autogenerated@email#{User.last.blank? ? 'autogenerated@email0.com' : User.last.id}"
        user.avatarc = auth.info.image
        user.username = auth.extra.raw_info.name
        user.password = Devise.friendly_token[0,20]
      end
    end
    user
  end

  # vkontakte
  def self.find_for_vkontakte_oauth auth
    
    if self.where(provider: auth.provider, uid: auth.uid).exists?
      user = self.where(provider: auth.provider, uid: auth.uid).first
      user.provider = auth.provider
      user.uid = auth.uid
      user.avatarc = auth.info.image
    else
      user = self.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = "autogenerated@email#{User.last.blank? ? 'autogenerated@email0.com' : User.last.id}"
        user.avatarc = auth.info.image
        user.username = auth.info.name
        user.password = Devise.friendly_token[0,20]
      end
    end
    user
  end
  
  
end
