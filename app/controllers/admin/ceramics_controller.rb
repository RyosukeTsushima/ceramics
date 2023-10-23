class Admin::CeramicsController < ApplicationController
    before_action :if_not_admin
    before_action :set_ceramic, only: [:new, :edit, :create]
    
    
    private
    def if_not_admin
        redirect_to root_path unless current_user.admin?
    end
    def set_ceramic
        @ceramic = Ceramic.new
    end
    def ceramic_params
        params.require(:ceramic).permit(:photo, :name, :region, :about, :price, :lat, :lng)
    end
end
