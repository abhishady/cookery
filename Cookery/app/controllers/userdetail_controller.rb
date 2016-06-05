class UserdetailController < ApplicationController
	layout "admin"
  before_filter :require_login_as_admin
  
    def new
      @user = UserDetail.new
    end
    def create
      @user = UserDetail.new(user_params)
      if @user.valid?
        @user.save
        flash[:success] = "User's Detail was successfully added."
        render "new"
      else
        render "new"
      end 
    end
    def list
      @users = UserDetail.all
    end
    def edit
      @user = UserDetail.find(params[:id])
  end
    def update
      @user = UserDetail.find(params[:id])
      if @user.update_attributes(user_params)
          flash[:success] = "User's Detail was successfully updated."
          redirect_to :action=>"list"
      end
    end
    def delete
      @user = UserDetail.find(params[:id])
      if @user.destroy
          flash[:danger] = "User's Detail was successfully deleted."
          redirect_to :action=>"list"
      end
   end
   def user_params
      params.require(:userdetail).permit(:user_id,:name,:address,:contact)
   end
end
