class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

	def create
		@user = User.create user_params
		
		if @user.persisted?
			flash[:success] = 'Registered!'
			redirect_to root_path
		else
			flash.now[:error] = "Error: #{@user.errors.full_message.to_s}"
			render 'new'
		end
	end

end
