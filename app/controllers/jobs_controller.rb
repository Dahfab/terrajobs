class JobsController < ActionController::Base
    def index 
    end

    def new 
        @job = Job.new
    end

    def create 
        @job = Job.new(job_params) 
        if @job.save 
            flash[:notice] = "Job angelegt!" 
            redirect_to :root
        else
            render action: :new
        end
    end

    def show
        @job = Job.find(params[:id]) 
    end

    def edit 
    end

    def update 
    end

    def destroy 
    end

    private
    def job_params
      params.require(:job).permit(:position, :description, :responsibilities, :requirements, :offers, :how_to_apply, :apply_url, :apply_mail, :apply_date)
    end
end