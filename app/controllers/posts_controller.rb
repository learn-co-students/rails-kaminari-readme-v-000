class PostsController < ApplicationController
	def index #@posts = Post.order(created_at: :desc).page(params[:page])
    @posts = Post.order(:author_id).page(params[:page])
  end

# Here we're using Kaminari's page method to get a "page" (ten, in our case) of results. We're passing
# params[:page] to the page method so that we can control which page
# we get. And if params[:page] is nil, we'll get the first page, so it works by default.

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params.require(:post))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end
end
