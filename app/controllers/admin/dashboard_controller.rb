class Admin::DashboardController < ApplicationController
  before_action :authorize!

  def index

  end  
end
