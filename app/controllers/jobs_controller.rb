class JobsController < ActionController::Base
    def index 
    end

    def new 
        @job = Job.new
    end
end