class ArticlesController < ApplicationController

	def new
	end

	def index
		@articles = Article.all 
	end

	def create
	end

	def edit
	end

	def update
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
	end
end
