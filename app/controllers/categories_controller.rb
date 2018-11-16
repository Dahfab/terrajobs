class CategoriesController < ActionController::Base
    def index 
    end

    def show
        @category = Category.friendly.find(params[:id]) 
    end
end