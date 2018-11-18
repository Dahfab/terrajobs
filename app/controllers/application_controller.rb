class ApplicationController < ActionController::Base
    before_action :initialize, only: :index
    
    def index 
    end

    private
    def initialize 
        @jobs = Job.all
        @category = Category.all
    end
end
