class ArticlesController < ApplicationController

	def new
		@article = Article.new
	end

	def index
		@articles = Article.all 
	end

	def create
		 @article = Article.new(article_params)
		if @article.save
			flash.notice = "Article was successfully created." 
			redirect_to @article 
		else
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
		flash.notice = "Article was successfully updated"			
		redirect_to article_path(@article) 
		else
			render 'edit'
		end
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def destroy
		@article = Article.find(params[:id])	
		@article.destroy	
		flash.notice = "Article was successfully destroyed."	 
	  redirect_to articles_url  
	end

	private

	def article_params
		params.require(:article).permit(:title, :body, :tag_list, :image)
	end
end
