class ImagesController < ApplicationController

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    respond_to do |format|
      format.js
    end
  end
  
  def sort
    image_album = Album.find(params[:image_album_id])
    params[:serialized_images].split(",").each_with_index do |id, index|
      image_album.images.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

end