class CategoriesController < ApplicationController
    before_action :category_name, only: :show

    def index 
    end

    def show
        @category_id = Category.friendly.find(params[:id])
        @jobs = Job.where(category_id: @category_id).order(created_at: :desc)
        @date = @jobs.order("created_at").first
    end

    private
    def category_name
        @category = Category.find_by_friendly_id(params[:id])
        if @category.name =~ /(.+)-jobs/i
            @category_name = @category.name
        else
            @category_name = @category.name + " Jobs"
        end
    end
    
end