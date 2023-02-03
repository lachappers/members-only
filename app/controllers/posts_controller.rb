class PostsController < ApplicationController

  before_action :set_post, only: %i[ edit update destroy show ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  
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
    @post = current_user.posts.new(post_params)

      if @post.save
        flash[:success] = "Great! Your post has been created!"
        redirect_to @post
        # format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        # format.json { render :show, status: :created, location: @post }
      else
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
        flash.now[:notice] = @post.errors.full_messages.to_sentence
        render :new, status: :unprocessable_entity
      end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post was successfully destroyed."
    redirect_to root_path, status: :see_other

  end

  private
  def set_post
    #users can see all posts
    # @post = Post.find(params[:id])
    #users can only see their own posts
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
