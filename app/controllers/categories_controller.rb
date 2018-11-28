class CategoriesController < ApplicationController

    def index 
    end

    def show
        @category = Category.find_by_friendly_id(params[:id])
        @category_id = Category.friendly.find(params[:id])
        @jobs = Job.where(category_id: @category_id).order(created_at: :desc)
    end
end