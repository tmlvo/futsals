class FutsalsController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create] 

    def top 
    end

    def index
        @futsals = Futsal.all
    end
    
    def new
        @futsal = Futsal.new
      end
    
      def create
        futsal = Futsal.new(futsal_params)
        if futsal.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      private
      def futsal_params
        params.require(:futsal).permit(:image, :name, :about)
      end
end
