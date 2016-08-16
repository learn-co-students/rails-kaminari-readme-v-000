class PostsController < ApplicationController
	def index
		# Using Kaminari gem to get posts by most recent and using page method to grab 10
		# as defined in config/initializers/kaminari
		# To get next 10 results use <%= paginate @posts %> in index page
		@posts = Post.order(created_at: :desc).page(params[:page])
	end

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
