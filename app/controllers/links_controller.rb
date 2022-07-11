class LinksController < ApplicationController
  def create
    link = Link.create(:link => params[:link], :fid => params[:fid])
    link.save
  end
  
  def public_link
    link = Link.find(params[:link_id].to_i)
    redirect_to link.link
  end
  
  def remove
    Link.destroy(params[:link_id].to_i)
    redirect_to users_path
  end
end
