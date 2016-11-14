class Video < ActiveRecord::Base
    has_many :taggings
    has_many :tags, through: :taggings
    mount_uploader :picture, PictureUploader
    validates :title, presence: true
    validates :code, presence: true
    validates :league, presence: true
    validates :picture, presence: true

    accepts_nested_attributes_for :tags
    accepts_nested_attributes_for :taggings
    
    def to_param
      "#{id} #{title}".parameterize
    end

    scope :all_except, ->(video) { where.not(id: video) }
end
