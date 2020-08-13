class ArtworksController < ApplicationController
    def index
        @artworks = []
        if params.has_key?(:user_id)
            @artworks << Artwork.where(artist_id: params[:user_id])
            @artworks << ArtworkShare.where(viewer_id: params[:user_id])
        else
            raise "ID not found"
        end
        render json: @artworks
    end

    def show
        render json: Artwork.find(params[:id])

        # artwork = Artwork.find(params[:id])
        # render json: artwork
    end

    def create
        @artwork = Artwork.new(artwork_params)

        if @artwork.save
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def update
        @artwork = Artwork.find(params[:id])
            if @artwork.update(artwork_params)
                redirect_to artwork_url(@artwork.id)
            else
                render json: @artwork.errors.full_messages, status: 422
            end
    end

    def destroy

        @artwork = Artwork.find(params[:id])

        @artwork.destroy

        redirect_to artworks_url

    end

    private

    def artwork_params

        params 
        .require(:artwork)
        .permit(:artist_id, :image_url)

    end
end