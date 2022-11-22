class PlantsController < ApplicationController
    def index 
        plants = Plant.all 
        render json: plants, except: [:created_at, :updated_at]
    end

    def show
        plants = Plant.find(params[:id])
        render json: plants, except: [:created_at, :updated_at]
    end

    def create
        plants = Plant.create(plant_params)
        render json: plants, except: [:created_at, :updated_at], status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
        # name: params[:name], image: params[:image], price: params[:price]
    end
end
