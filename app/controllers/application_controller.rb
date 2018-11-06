class ApplicationController < ActionController::Base
    def index 
        @jobs = Job.all
    end
end
