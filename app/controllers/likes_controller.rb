class LikesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @blog = Blog.find(params[:blog_id])
      @like = @blog.likes.build(user: current_user)
  
      if @like.save
        redirect_to blog_url(@blog)
        # render json: { likes_count: @blog.likes_count }
      else
        render json: { status: 'error', message: 'Failed to like blog' }
      end
    end
  
    def destroy
      @blog = Blog.find(params[:blog_id])
      @like = @blog.likes.find_by(user: current_user)
  
      if @like
        if @like.destroy
            redirect_to blog_url(@blog)
            # render json: { status: 'success', likes_count: @blog.likes_count }
        else
          render json: { status: 'error', message: 'Failed to unlike blog' }
        end
      else
        render json: { status: 'error', message: 'Like not found' }
      end
    end
end
  