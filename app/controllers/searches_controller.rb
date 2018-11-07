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
        @mentors = @search.mentors
    end

    private
    def mentor_params
        result = params.require(:search).permit(:keywords, :min_price, :max_price)
        if result[:min_price].length == 0
          result[:min_price] = 0
        end
        if result[:max_price].length == 0
          result[:max_price] = 80000
        end
        result
    end
end
