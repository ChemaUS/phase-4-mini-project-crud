class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices
    end
    def show
        spice= Spice.find(params[:id])
        render json: spice
    end
    def create
        new_spice = Spice.create!(spice_params)
        render json: new_spice, status: :created
    end
    def update
        new_spice= Spice.find(params[:id])
        new_spice.update!(spice_params)
        render json: new_spice, status: :accepted
    end
    def destroy
        delete_spice= Spice.find(params[:id])
        delete_spice.destroy
        head :no_content
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
