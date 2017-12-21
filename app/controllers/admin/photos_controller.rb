class Admin::PhotosController < Admin::ApplicationController

  def create
    @deal = Deal.find(params[:deal_id])

    if params[:images]
      params[:images].each do |img|
        @deal.photos.create(image: img)
      end

      @photos = @deal.photos
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @deal = @photo.deal

    @photo.destroy
    @photos = Photo.where(deal_id: @deal.id)

  #   respond_to :js
  end
end
