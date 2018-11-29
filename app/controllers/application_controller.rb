class ApplicationController < ActionController::Base
    before_action :initialize_variables, only: :index
    
    def index 
        if params[:search].present?
            @output = Job.near(params[:search], 20)
        end
        @jobs_week = @this_week - @jobs_today
        @jobs_month = @this_month - @this_week
    end

    private
    def initialize_variables 
        @jobs = Job.all.where("created_at < ?", 1.month.ago).order(created_at: :desc)
        @jobs_today = Job.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(created_at: :desc)
        @this_week = Job.where(created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week).order(created_at: :desc)
        @this_month = Job.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).order(created_at: :desc)
        @category = Category.all
    end
end
