class CategoriesController < ApplicationController

  before_action :require_admin,  except: [:index, :show]
  before_action :set_category, only: [:show, :edit]

	def new
    @category = Category.new
	end	

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category was created successfull"
			redirect_to categories_path

		else
		  render 'new'
	end  	

	end	

	def show
		@category = Category.find(params[:id])
		@category_articles= @category.articles.paginate(page: params[:page], per_page: 5)
	end

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	private
    def set_category
      @category = Category.find(params[:id])
	  end

	  def category_params
	   	params.require(:category).permit(:name)
	   	 
	  end

	  def require_admin
      if logged_in? || (logged_in && !current_user.admin?)
      	flash[:danger] = "Only admin user can perform this action"
      	redirect_to articles_path
      end	
	  end	
end	