class Video < ActiveRecord::Base
    mount_uploader :picture, PictureUploader
    validates :title, presence: true
    validates :code, presence: true
    validates :league, presence: true
    validates :picture, presence: true
    
    def to_param
      "#{id} #{title}".parameterize
    end
end
