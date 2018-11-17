class CategoriesController < ActionController::Base
    def index 
    end

    def show
        @category = Category.find_by_friendly_id(params[:id]) 
    end
end