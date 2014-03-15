class PhotogalleryController < ApplicationController
  
  load_and_authorize_resource

  def index
    @photos = Photo.includes(:photogallery).all
  end

end
