class ResponsesController < ApplicationController
  inherit_resources
  actions :index
  authorize_resource
  respond_to :html, :xml
  
  def index
    @websites = Website.accessible_by(current_ability).all
    website_ids = @websites.map{ |s| s.id }
    @responses = Response.includes(:website).where(:website_id => website_ids)
    
    if params[:filters]
      if params[:filters][:website_id]
        raise CanCan::AccessDenied unless website_ids.include? params[:filters][:website_id].to_i
        @responses = @responses.where(:website_id => params[:filters][:website_id])
      end

      if params[:filters][:is_good]
        @responses = params[:filters][:is_good] == '1' ? @responses.good : @responses.bad
      end
      
    end
    
    @responses = @responses.paginate(:page => params[:page])
    super
  end
  
end
