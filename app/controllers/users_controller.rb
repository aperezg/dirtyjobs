class UsersController < ApplicationController
  before_action :authenticate_user!, except:[:show]
  def show
    @user = User.find_by(:username => params[:id])
  end
  
  def personal
    @userPresenter = Users::PersonalPresenter.new(current_user)
  end
  
    
  
end