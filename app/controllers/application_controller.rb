class ApplicationController < ActionController::Base
    def index 
        @jobs = Job.all
        @category = Category.all
    end
end
