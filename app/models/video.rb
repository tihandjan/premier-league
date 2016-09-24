class Video < ActiveRecord::Base
    mount_uploader :picture, PictureUploader
    validates :title, presence: true
end
