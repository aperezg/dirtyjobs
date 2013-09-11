class Companies::ShowPresenter
  attr_accessor :company
  
  def initialize(company)
    @company = company
  end
  
  def comments
    @comments ||= @company.comments.all
  end
  
end