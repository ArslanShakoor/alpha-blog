class UsersController  < ApplicationController

	def new
		@user= User.new
	end	

  def create
    @user = User.new(user_params)

		if @user.save
			flash[:success] = "Congrats #{@user.username}, Welcome to Alpha Blog"
			redirect_to articles_path
		else
			 render 'new'
		end  	
	end

	def show
    @user = User.find(params[:id])
    

	end	

	def edit
		@user = User.find(params[:id])
  end

	def update
		@user = User.find(params[:id])
 
		if @user.update(user_params)
			flash[:success] = "User was successfully updated"
			redirect_to articles_path
		else
		  render 'edit'	
	end  

	end	

	private
	  def set_article
      @article = Article.find(params[:id])
	  end
	  	
	  def user_params
	  	params.require(:user).permit(:username, :email, :password)
	  end	


end	

