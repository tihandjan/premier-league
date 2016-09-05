class Article < ActiveRecord::Base
    has_many :pictures, dependent: :destroy
    mount_uploader :picture, PictureUploader
    
    accepts_nested_attributes_for :pictures
    
end
