class TagsController < ApplicationController
    def index
        redirect_to root_path
    end

    def show
        @articles = Tag.find_by(name: params[:id]).articles
    end
end