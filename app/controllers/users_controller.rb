class UsersController < ApplicationController
#	before_action :validate_user!,only: [:show,:edit,:update,:destroy]
before_action :select_user, only: [:show, :edit, :update, :destroy]
before_action only: [:edit, :update, :destroy] do
	validate_permission! select_user
end
def index
	@users=User.all
end
def new
	@user=User.new
end
def create
	@user=User.new(user_params)
	@user.admin=false
	if @user.save
		login(@user)
		redirect_to @user, notice: 'Aramıza hoşgeldin.'
	else
		render :new
	end

end

def show

	
	if Customerbalance.find_by_user_id(@user.id)==nil
		@total_balance=0.0
	else
		@total_balance=Customerbalance.find_by_user_id(@user.id).total_balance
	end
	@user_orders=Order.where(user_id: current_user.id)
	@orders = @user_orders.all.order('created_at DESC')
end
def edit
end
def create_order
	@order=Order.new
	@order.user=current_user
	@order.save
	redirect_to @order	
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
