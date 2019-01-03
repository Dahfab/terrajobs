class JobsController < ApplicationController
    before_action :initialize_variables, only: [:new, :create]

    def index 
    end

    def new 
        @job = Job.new
        expires_in 7.days, public: true
        @job.build_company 
        render layout: "layouts/job-new"
    end

    def create 
        @job = Job.new(job_params)
        @job.create_company(job_params[:company_attributes])

        if params[:stripeEmail].present? && params[:stripeToken].present?
            create_stripe_payment
        end

        if @job.save
            flash[:notice] = "Vielen Dank! Job wurde erfolgreich angelegt." 
            redirect_to :root
        else
            render action: :new
        end
    end

    def show
        @job = Job.friendly.find(params[:id])
        expires_in 7.days, public: true
        @category = Category.friendly.find(@job.category_id)
        @type = Type.find(@job.type_id)
        @previous_url = URI(request.referrer).path 
        create_previous_url
        @date = Date.today
    end

    def edit 
    end

    def update 
    end

    def destroy 
    end
    

    private
    def initialize_variables
        @categories = Category.all
        @types = Type.all
    end

    def job_params
        params.require(:job).permit(
        :position, 
        :description, 
        :responsibilities, 
        :requirements, 
        :offers, 
        :how_to_apply, 
        :apply_url, 
        :apply_mail, 
        :apply_date,
        :highlight,
        :address,
        :category_id,
        :type_id,
        company_attributes: [
            :id, 
            :_destroy, 
            :company_id, 
            :name, 
            :mail, 
            :address,
            :facebook_url, 
            :twitter_url, 
            :logo
        ] 
        )
    end

    def create_stripe_payment
        begin
            customer = Stripe::Customer.create(
                :email => params[:stripeEmail],
                :source  => params[:stripeToken]
            )

            charge = Stripe::Charge.create(
                :customer    => customer.id,
                :amount      => 9900,
                :description => 'Terrajobs Kunde',
                :currency    => 'eur'
              )

        rescue Stripe::CardError => e
            flash[:notice] = e.message
            render action: :new
        end
    end

    def create_previous_url
        if @previous_url =~ /\/(.+)\/(.+)/i
            @previous_url = root_path 
        else
            @previous_url = request.referrer
        end
    end
end