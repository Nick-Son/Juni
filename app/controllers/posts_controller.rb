class PostsController < ApplicationController

    def index
      @posts = Post.all  
    end 

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(params.require(:post).permit(:title, :body))

      if @post.save
        redirect_to @post
      else
        render 'new'
      end  
    end

    def show
      @post = Post.find(params[:id])
    end 

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])

      if @post.update(params.require(:post).permit(:title, :body))
        redirect_to @post
      else
        render 'edit'
      end
    end
    
    def destroy
    end


end