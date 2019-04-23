class UsersController < ApplicationController
	before_action :select_user, only: [:show, :edit, :update, :destroy]
	before_action only: [:edit, :update, :destroy] do
		validate_permission! select_user
	end
	def new
		@user=User.new
	end
	def create
		@user=User.new(user_params)
		if @user.save
			login(@user)
			redirect_to @user, notice: 'Aramıza hoşgeldin.'
		else
			render :new
		end

	end

	def show
	end
	def edit
	end

	
	def update
		update_params = user_params
		if update_params.has_key?(:password)
			update_params.delete([:password, :password_confirmation])
		end

		if @user.update(update_params)
			redirect_to @user, notice: 'Profil bilgileriniz güncellendi.'
		else
			render :edit, layout: "profile"
		end
	end
	def destroy
		logout
		@user.destroy
		redirect_to root_url
	end
	private
	def user_params
		params.require(:user).permit!
	end
	def select_user
		@user = User.find_by_username(params[:id])
	end
	
end
