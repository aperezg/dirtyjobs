class Users::PersonalPresenter
  def initialize(user)
    @user = user
  end
   
  def companies
    @companies ||= @user.companies.all
  end
  
  def comments_total
    @count ||= @user.comments.count
  end
  
end