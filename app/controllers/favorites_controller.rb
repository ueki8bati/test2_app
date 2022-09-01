class FavoritesController < ApplicationController
    def create
        @favorite = current_user.favorites.create(management_id: params[:management_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @management = Management.find(params[:management_id])
        @favorite = current_user.favorites.find_by(management_id: @management.id)
        @favorite.destroy
        redirect_back(fallback_location: root_path)
    end
end
