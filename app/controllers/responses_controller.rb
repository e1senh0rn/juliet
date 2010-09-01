class ResponsesController < ApplicationController
  inherit_resources
  actions :index
  authorize_resource
  
  def index
    @websites = Website.accessible_by(current_ability).all
    website_ids = @websites.map{ |s| s.id }
    unless params[:website_id].blank?
      raise CanCan::AccessDenied unless website_ids.include? params[:website_id].to_i
      @responses = Response.includes(:website).where(:website_id => params[:website_id]).paginate(:page => params[:page])
    else
      @responses = Response.includes(:website).where(:website_id => website_ids).paginate(:page => params[:page])
    end
    super
  end
  
end
