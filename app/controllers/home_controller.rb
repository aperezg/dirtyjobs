class HomeController < ApplicationController
  def index
    @companies = Company.recent
  end
end