class CommentsController < ApplicationController
    before_action :find_commentable

    def new
      @comment = Comment.new
    end

    def create
      @comment = @commentable.comments.create(comment_params)
      @data = Article.find(params[:article_id]) if params[:article_id]
      @data = Video.find(params[:video_id]) if params[:video_id]
      if params[:comment_id]
        @com = Comment.find(params[:comment_id]) 
        @data = Article.find(@com.commentable_id) if @com.commentable_type == 'Article'
        @data = Video.find(@com.commentable_id) if @com.commentable_type == 'Video'
      end
      respond_to do |format|
          format.html { redirect_to :back }
          format.js
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
      @commentable = Video.find_by_id(params[:video_id])     if params[:video_id]
    end
    
end