class PostsController < ApplicationController

  respond_to :js, :html
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.by_token(params[:id])
  end
  
  def edit
    @post = Post.by_token(params[:id])
    respond_with @post
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post, message: "Way to Go!"
    else
      render :new
    end
  end
  
  def update
    @post = Post.by_token(params[:id])
    @post.update_attributes(params[:post])
    respond_with @post, message: "Way to Go!"

  end

end
