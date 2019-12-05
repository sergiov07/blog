class ArticlesController < ApplicationController

	before_action :authenticate_user!, except: [:show,:index]
	before_action :set_article, except: [:index,:new]
	
	#GET /articles
	def index
		@articles = Article.all
	end

	#GET /articles/:id
	def show		
	end

	#GET /articles/new
	def new
		@article = Article.new
	end

	def edit	
		
	end

	#POST /article
	def create
		@article = current_user.articles.new(articles_params)
		if @article.save
			redirect_to @article
		else
			render :new		
		end
	end
	def destroy
		
		@article.destroy #elimina objeto de la BD
		redirect_to articles_path
	end

	def update			
		if @article.update(articles_params)
			redirect_to @article
		else
			render :edit
		end
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	def validate_user
		redirect_to new_user_session_path, notice: "Necesitas Iniciar Sesion"
	end

	def articles_params
		params.require(:article).permit(:title,:body)
	end
end