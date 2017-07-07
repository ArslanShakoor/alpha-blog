class UsersController  < ApplicationController

	before_action :set_user, only: [:edit, :update, :show]
	before_action :require_user, only: [:edit, :update]
	before_action :require_same_user, only: [:edit, :update]
	before_action :require_admin, only: [:destroy]
 
  def index
  	@users = User.paginate(page: params[:page], per_page: 5)

  end

	def new
		@user= User.new
	end	

  def create
    @user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Congrats #{@user.username}, Welcome to Alpha Blog"
			redirect_to user_path(@user)
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

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:danger]= "User and articles have been successfully deleted"
		redirect_to users_path
	end	
 

	private
	  def set_user
	  @user = User.find(params[:id])
	  end
	  	
	  def user_params
	  	params.require(:user).permit(:username, :email, :password)
	  end

	  def require_same_user
	  	if current_user != @user and !current_user.admin?
	  	  flash[:danger] ="You can only edit your own profile"
	  	  redirect_to root_path
	  	end 
	  end	

	  def require_admin
      if logged_in? and !current_user.admin?
      	flash[:danger] = "Only admin user can perform this action"
      end	
	  end	
end	
