class UsersController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update]

	def show
		@articles = @user.articles
	end


	def new
		@user = User.new
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "Account successfully updated!"
			redirect_to articles_path
		else
			render 'edit'
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully created an account!"
			redirect_to articles_path
		else
			render 'new'
		end
	end


	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

end