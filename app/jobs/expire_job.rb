class ExpireJob
    include SuckerPunch::Job
  
    def perform(job_free, job_highlight)
        job_free.where("created_at <= ?", 45.days.ago).destroy_all
        job_highlight.where("created_at <= ?", 90.days.ago).destroy_all
    end
end
