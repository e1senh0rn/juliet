class DashboardController < ApplicationController
  respond_to :html
  # authorize_resource
  
  def index
    @websites = current_user.websites.order(:created_at.desc).limit(10)
    @issues = current_user.responses.bad.order(:created_at.desc).includes(:website)
  end
end
