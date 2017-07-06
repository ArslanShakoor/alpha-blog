class UsersController  < ApplicationController

	before_action :set_user, only: [:edit, :update, :show]
 
  def index
  	@users = User.paginate(page: params[:page], per_page: 5)

  end

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
    @user_paginate = @user.articles.paginate(page: params[:page], per_page: 5)
  end	

	def edit
		 
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
	  def set_user
	  @user = User.find(params[:id])
	  end
	  	
	  def user_params
	  	params.require(:user).permit(:username, :email, :password)
	  end
end	
