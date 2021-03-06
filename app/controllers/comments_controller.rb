class CommentsController < ApplicationController

	def new
	end

	def create
		 @comment = Comment.new(comment_params)
		 @comment.article_id = params[:article_id]
		 	
		 @comment.save
		 
		 redirect_to article_path(@comment.article)	
	end

	def edit
	end

	def update
	end

	def delete
	end

	private

	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end
end
