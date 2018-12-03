class ApplicationController < ActionController::Base
   before_action :initialize_variables, only: :index
    
    def index
        if params[:search].present?
            @search_query = params[:search]
            define_radius
            find_jobs_near_location
        end
        exlude_present_jobs
    end

    private
    def not_authenticated
        redirect_to main_app.backend_path
    end

    def initialize_variables 
        @jobs = Job.where("created_at < ?", 1.month.ago).order(created_at: :desc)
        @jobs_today = Job.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(created_at: :desc)
        @this_week = Job.where("created_at > ?", 1.week.ago).order(created_at: :desc)
        @this_month = Job.where("created_at > ?", 1.month.ago).order(created_at: :desc)
        @category = Category.all
    end

    def define_radius
        @radius = params[:radius]
        if @radius.empty?
            @radius = 20
        end
    end

    def exlude_present_jobs
        @jobs_week = @this_week - @jobs_today
        @jobs_month = @this_month - @this_week
    end

    def find_jobs_near_location
        @jobs = @jobs.near(params[:search], @radius)
        @jobs_today = @jobs_today.near(params[:search], @radius)
        @this_week = @this_week.near(params[:search], @radius)
        @this_month = @this_month.near(params[:search], @radius)
    end
    
end
