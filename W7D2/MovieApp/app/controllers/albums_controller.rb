class AlbumsController < ApplicationController
    def new
        @bands = Band.all
        render :new
    end

    def create
        @bands = Band.all
        @album = Album.new(album_params)
        if @album.save
            redirect_to band_url(@album.band_id)
        else
            flash[:errors] = @album.errors.full_messages
            redirect_to new_band_album_url(@album.band_id)
        end
    end

    def show
        @album = Album.find_by(id: params[:id])
        render :show
    end

    def edit
        @bands = Band.all
        @album = Album.find_by(id: params[:id])
        render :edit
    end

    def update
        @album = Album.find_by(id: params[:id])
        if @album.update_attributes(album_params)
            redirect_to album_url(@album.id)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit, status: 422
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])
        @album.destroy
        redirect_to band_url(@album.band_id)
    end

    private

    def album_params
        params
            .require(:album)
            .permit(:band_id, :title, :album_type, :year)
    end
end