class ArticlesController < ApplicationController

	def index

    @articles = Article.all
	end

	def new
		@articles = Article.new
	end

	def create
   
   @articles = Article.new(add_params)

    if @articles.save
    	flash[:success] = "Article was Successfuly Created"
    	redirect_to article_path(@articles)
    
     else
 
	render 'new'

    end

	end

	def edit
 
   @articles = Article.find(params[:id])
	end

	def update

		 @articles = Article.find(params[:id])
		 if @articles.update(add_params)
		 	flash[:success] ="Article Updated Successfuly"
		 	redirect_to article_path(@articles)
		 else

		 	
		 	render 'edit'
		 end

	end

	def destroy

		@articles =Article.find(params[:id])
		if @articles.destroy
			flash[:danger] ="Article Deleted Successfuly"
		redirect_to articles_path
	end

	end

	def show

		@articles =Article.find(params[:id])

	end

	private

	def add_params

    params.require(:article).permit(:name,:discription)
	end

end