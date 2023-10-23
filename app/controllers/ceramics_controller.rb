class CeramicsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
        if params[:search] != nil && params[:search] != ''
            #部分検索かつ複数検索
            search = params[:search]
            @ceramics = Ceramic.where("name LIKE ? OR about LIKE ?", "%#{search}%", "%#{search}%")
          else
            @ceramics = Ceramic.all
          
      end
    end

    def new
        @ceramic = Ceramic.new
      end
    
      def create
        ceramic = Ceramic.new(ceramic_params)
        ceramic.user_id = current_user.id
        if ceramic.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @ceramic = Ceramic.find(params[:id])
      end

      def edit
        @ceramic = Ceramic.find(params[:id])
      end

      def update
        ceramic = Ceramic.find(params[:id])
        if ceramic.update(ceramic_params)
          redirect_to :action => "show", :id => ceramic.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        ceramic = Ceramic.find(params[:id])
        ceramic.destroy
        redirect_to action: :index
      end



      private
      def ceramic_params
        params.require(:ceramic).permit(:photo, :name, :region, :about, :price, :lat, :lng)
      end
     
    
end