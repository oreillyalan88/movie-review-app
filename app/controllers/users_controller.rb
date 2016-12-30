class UsersController < ApplicationController
  before_action :logged_in_user, only: [:destroy, :index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
    def show
      @user = User.find(params[:id])
      # redirect_to root_url and return unless @user.activated?
      @reviews = @user.reviews.paginate(page: params[:page])
    end
    
    
    def new
      @user = User.new
    end
    
    def index
      @users = User.where(activated: true).paginate(page: params[:page], :per_page=> 8)
    end
    
    def create
      secure_params = params.require(:user).permit(:name, :email, 
                                    :password, :password_confirmation)
         @user = User.new(secure_params)
         if @user.save
          @user.send_activation_email
          flash[:info] = "Please check your email to activate your account."
          redirect_to root_url
         else
             render 'new'     
         end
    end
  
    def edit
      @user = User.find(params[:id])
    end
    
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to users_url
    end
    
    def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
      else
        render 'edit'
      end
    end

      private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    # Before filters
    
        
    # confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    
    
end
