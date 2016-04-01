class UsersController < ApplicationController
  #remove index?
  def index
    @user = User.new
    @users = User.all
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
 
    respond_to do |format|
      if @user.save
        format.html { 
          sign_in(@user)
          UserMailer.welcome_mail(@user).deliver_later
          redirect_to @user, notice: "User successfully created!" 
        }
        format.js   { redirect_to users_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params 
    params.require(:user).permit(:email, :password)
  end
end