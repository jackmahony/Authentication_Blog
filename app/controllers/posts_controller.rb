class PostsController < ApplicationController  

  def index
    @posts = Post.all  
  end  

  def show
    @post = Post.find(params[:id])  
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = Current.user
    if @post.save
      flash[:notice] = "Article was successfully created"
      redirect_to new_post_path
   else
    flash[:notice] = "You do not have permission to create posts"
    redirect_to posts_index_path
   end
  end

  def edit
    @post = Post.find(params[:id])
  end  

  def update
    @post = Post.find(params[:id])
    if @post.user == current_user 
      @post.update(post_params)
      flash[:notice] = "Article was successfully updated!"
      redirect_to posts_index_path
    else
      redirect_to '/index'
      flash[:notice] = "you do not have permissions to update this post!"
    end  
   
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
