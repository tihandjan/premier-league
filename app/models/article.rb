class Article < ActiveRecord::Base
    has_many :pictures, dependent: :destroy
    validates :title, presence: true, length: { minimum: 10, maximum: 150 }
    validates :summary, presence: true, length: { minimum: 10, maximum: 250 }
    validates :description, presence: true, length: { minimum: 10, maximum: 5000 }
    validates :picture, presence: true
    validates :league, presence: true
    mount_uploader :picture, PictureUploader
    accepts_nested_attributes_for :pictures

    after_create :fb_page_post
    
    
    
    scope :all_except, ->(article) { where.not(id: article) }
    
    scope :my_team_news, ->(current_user) { order('created_at DESC').where(team: current_user.team, category: 'news').first(4) }
    
    
    def to_param
      "#{id} #{title}".parameterize
    end

    def fb_page_post
        # graph = Koala::Facebook::API.new('EAAHzbwanpNkBACUZASA7i3gXZA9XIZCBbH19j5q7sNfZAm28NrOWgq0uoGnG8ZBDtcyPPWdJZBBmxzyd3HkoK49qEU0i0EHkSmy2ty4FmpHicMpA5OzsJXwyzL8mpJZCKrAM0jOxCZAdCAXVw3bYVIPYcdnivn4Vsi9UWEqdIBO5JAZDZD')
        # page_access_token = graph.get_page_access_token('1411234032511437')
        page_graph = Koala::Facebook::API.new('EAAHzbwanpNkBAM8eubPtHKw6KaSw2dehtxwnzsnjYxGrTMjZAT9OLWZC3kVrqKG8A4Enqcdyy4ZAwLs2xNoWQlEqFuRQr5hgVfOcZCqASWxxmFOTZC4X2RU0vtWl00GSrPTlh2oDtirj8f15NPTIsR2fZBAEbp0OfkgdMGr0oqlAZDZD')
        page_graph.put_wall_post(self.title , {
        "link" => "http://euroliga.com/#{Rails.application.routes.url_helpers.league_article_path(self.league, self)}",
        "name" => self.summary,
        "description" => self.description,
        "picture" => Article.last.picture.url,
        })
    end
    
end
