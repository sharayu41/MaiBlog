class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.likes=0
    @blog.dislikes=0
    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    @blog = Blog.find(params[:id])
    @blog.increment!(:likes) # Increment the likes count for the blog.
    respond_to do |format|
      format.html { redirect_to @blog, notice: 'Liked the blog!' }
      format.json { render json: { likes: @blog.likes } }
    end
  end
  def dislike
    @blog = Blog.find(params[:id])

    if @blog.liked_by_current_user?(current_user)
      # User has previously liked the blog, so they can't dislike it.
      flash[:alert] = 'You can only dislike if you haven\'t liked it.'
    else
      @blog.increment!(:dislikes) # Increment the dislikes count for the blog.
      flash[:notice] = 'Disliked the blog!'
    end
  end

  
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content, :likes, :dislikes,blogimages: [])
    end

 
end
