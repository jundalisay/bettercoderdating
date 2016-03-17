class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

	def create
		@user = User.create (user_params)
		
		if @user.persisted?
			flash[:success] = 'Registered!'
			redirect_to root_path
		else
			flash.now[:error] = "Error: #{@user.errors.full_message.to_s}"
			render 'new'
		end
	end



  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :image_url)
    end

end
