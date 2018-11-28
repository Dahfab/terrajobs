class ApplicationController < ActionController::Base
    before_action :initialize_variables, only: :index
    
    def index 
    end

    private
    def initialize_variables 
        @jobs = Job.all
        @category = Category.all
    end
end
