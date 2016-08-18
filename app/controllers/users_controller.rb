class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def downgrade
    @user = User.find(params[:user_id])
    @user.standard!
    redirect_to :back
  end
  
end
