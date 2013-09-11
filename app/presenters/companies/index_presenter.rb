class Companies::ShowPresenter
  attr_accesor :company
  
  def initialize(company)
    @company = company
  end
  
  def comments
    @comments ||= @company.comments.all
  end
  
end