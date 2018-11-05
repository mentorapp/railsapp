class SearchesController < ApplicationController
    def new
        @search = Search.new
    end

    def create
        @search = Search.create!(mentor_params)
        redirect_to @search
    end

    def show
        @search = Search.find(params[:id])
    end

    private
    def mentor_params
        params.require(:search).permit(:keywords, :min_price, :max_price)
    end
end
