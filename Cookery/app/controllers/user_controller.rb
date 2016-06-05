class UserController < ApplicationController
  	layout "admin"
    before_filter :require_login_as_admin
      def index
        
      end
      def new
        @user = User.new
      end
      def create
        @user = User.new(user_params)
        if @user.valid?
          @user.save
          flash[:success] = "User was successfully added"
          redirect_to :action=>"list"
        else
          render "new"
        end 
      end
      def list
        @users = User.all
      end
      def edit
        @user = User.find(params[:id])
      end
      def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "User was successfully updated"
            redirect_to :action=>"list"
        end
      end
      def delete
        @user = User.find(params[:id])
        if @user.destroy
            flash[:danger] = "User was successfully deleted"
            redirect_to :action=>"list"
        end
     end
     def user_params
        params.require(:user).permit(:name,:email,:password,:is_admin,:is_active,:is_staff)
     end
end
