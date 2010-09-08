class WebsitesController < ApplicationController
  inherit_resources
  authorize_resource
  respond_to :html, :xml
  
  def index
    @websites = Website.accessible_by(current_ability).includes(:user).all
    super
  end
  
  def new
    @website = Website.new :user => current_user, :ttl => 10
    super
  end
    
end
