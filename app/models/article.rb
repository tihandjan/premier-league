class Article < ActiveRecord::Base
    has_many :pictures, dependent: :destroy
    validates :title, presence: true, length: { minimum: 10, maximum: 150 }
    validates :summary, presence: true, length: { minimum: 10, maximum: 250 }
    validates :description, presence: true, length: { minimum: 10, maximum: 5000 }
    validates :picture, presence: true
    mount_uploader :picture, PictureUploader
    
    accepts_nested_attributes_for :pictures
    
    
    
    scope :all_except, ->(article) { where.not(id: article) }
    
    scope :my_team_news, ->(current_user) { order('created_at DESC').where(team: current_user.team, category: 'news').first(4) }
    
    
    def to_param
      "#{id} #{title}".parameterize
    end
    
end
