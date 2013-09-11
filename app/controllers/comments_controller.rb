class CommentsController < ApplicationController
  
  def create
    params = comment_params(current_user)
    Comment.create(params)
    company = Company.find_by(:id => params[:company_id])
    redirect_to company_path(company)
  end
  
  private
  
  def comment_params(user)
    params
    .require(:comment)
    .permit(:comment, :based_opinion, :company_id)
    .merge(user: user)
  end
  
end