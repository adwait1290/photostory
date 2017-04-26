class PhotosController < ApplicationController
	def new
	end

	def show
		@photos = Photo.all 
	end
	def create
		@photo = Photo.create(photo_params)
		if @photo.save
			redirect_to photos_show_path
		else
			flash[:photo_errors] = @photo.errors.full_messages
			redirect_to photos_new_path
		end
	end

	def edit
	end

	def destroy
	end
	private
	def photo_params
		params.require(:photo).permit(:title, :city, :state, :description, :story, :image).merge(user: current_user)
	end
end
