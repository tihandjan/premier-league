class Article < ActiveRecord::Base
    has_many :pictures, dependent: :destroy
    validates :title, presence: true, length: { minimum: 10, maximum: 150 }
    validates :summary, presence: true, length: { minimum: 10, maximum: 250 }
    validates :description, presence: true, length: { minimum: 10, maximum: 5000 }
    validates :picture, presence: true
    mount_uploader :picture, PictureUploader
    accepts_nested_attributes_for :pictures

    after_create :fb_page_post
    
    
    
    scope :all_except, ->(article) { where.not(id: article) }
    
    scope :my_team_news, ->(current_user) { order('created_at DESC').where(team: current_user.team, category: 'news').first(4) }
    
    
    def to_param
      "#{id} #{title}".parameterize
    end

    def fb_page_post
        graph = Koala::Facebook::API.new('EAACEdEose0cBAHYusQXoDEm7a5Gl3ijrFg1AdmmDZBEpKEDCWuYGnT4JZADVgXYmMlnpeni4Eba16IeEz28ElMvqx5lYvRLpe3VZAN0PY8wL8VQtZAoxv7DlQlDOQEvHknOezdQBNTo33RtG8ALFX3lOZCTQc5OdepBJlyBfJJAYYGny6zyYI')
        graph.put_wall_post(self.title , {
        "link" => "http://euroliga.com/#{Rails.application.routes.url_helpers.article_path(self)}",
        "name" => self.summary,
        "description" => self.description,
        "picture" => Article.last.picture.url,
        })
    end
    
end
