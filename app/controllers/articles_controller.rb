class ArticlesController < ApplicationController

before_action :set_article, only: [:edit, :update, :show, :destroy]
before_action :require_user, except: [:index, :show]

before_action :require_same_user, only: [:edit, :update, :destroy]

	def index

    @articles = Article.paginate(page: params[:page], per_page: 5)
	end

	def new
		@articles = Article.new
	end

	def create
   
   @articles = Article.new(add_params)
    @articles.user = current_user
    if @articles.save
    	flash[:success] = "Article was Successfuly Created"
    	redirect_to article_path(@articles)
    
     else
 
	render 'new'

    end

	end

	def edit
 
	end

	def update

		 if @articles.update(add_params)
		 	flash[:success] ="Article Updated Successfuly"
		 	redirect_to article_path(@articles)
		 else

		 	
		 	render 'edit'
		 end

	end

	def destroy
		if @articles.destroy
			flash[:danger] ="Article Deleted Successfuly"
		redirect_to articles_path
	end

	end

	def show

	end

	private

	def set_article

	@articles = Article.find(params[:id])

    end

	def add_params

    params.require(:article).permit(:name,:discription)
	end
	def require_same_user

	if current_user != @articles.user

	flash[:danger] = "You can only edit or delete your own articles"

	redirect_to root_path

	end

	end

end