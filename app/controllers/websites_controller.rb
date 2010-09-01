class WebsitesController < ApplicationController
  inherit_resources
  authorize_resource
  
  def index
    @websites = Website.accessible_by(current_ability).includes(:user).all
    super
  end
  
  
end
