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

      def show
        @futsal = Futsal.find(params[:id])
      end
    
      def edit
        @futsal = Futsal.find(params[:id])
      end
    
      def update
        futsal = Futsal.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => futsal.id
        else
          redirect_to :action => "new"
        end
      end

      private
      def futsal_params
        params.require(:futsal).permit(:image, :name, :about)
      end
end
