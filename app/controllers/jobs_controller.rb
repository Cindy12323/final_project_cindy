class JobsController < ApplicationController
  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(:distinct => true).includes(:contact).page(params[:page]).per(10)

    render("job_templates/index.html.erb")
  end

  def show
    @job = Job.find(params.fetch("id_to_display"))

    render("job_templates/show.html.erb")
  end

  def new_form
    @job = Job.new

    render("job_templates/new_form.html.erb")
  end

  def create_row
    @job = Job.new

    @job.contact_id = params.fetch("contact_id")
    @job.company = params.fetch("company")
    @job.position = params.fetch("position")
    @job.location = params.fetch("location")
    @job.start_date = params.fetch("start_date")
    @job.end_date = params.fetch("end_date")
    @job.current = params.fetch("current")

    if @job.valid?
      @job.save

      redirect_back(:fallback_location => "/jobs", :notice => "Job created successfully.")
    else
      render("job_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_contact
    @job = Job.new

    @job.contact_id = params.fetch("contact_id")
    @job.company = params.fetch("company")
    @job.position = params.fetch("position")
    @job.location = params.fetch("location")
    @job.start_date = params.fetch("start_date")
    @job.end_date = params.fetch("end_date")
    @job.current = params.fetch("current")

    if @job.valid?
      @job.save

      redirect_to("/contacts/#{@job.contact_id}", notice: "Job created successfully.")
    else
      render("job_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @job = Job.find(params.fetch("prefill_with_id"))

    render("job_templates/edit_form.html.erb")
  end

  def update_row
    @job = Job.find(params.fetch("id_to_modify"))

    @job.contact_id = params.fetch("contact_id")
    @job.company = params.fetch("company")
    @job.position = params.fetch("position")
    @job.location = params.fetch("location")
    @job.start_date = params.fetch("start_date")
    @job.end_date = params.fetch("end_date")
    @job.current = params.fetch("current")

    if @job.valid?
      @job.save

      redirect_to("/jobs/#{@job.id}", :notice => "Job updated successfully.")
    else
      render("job_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_contact
    @job = Job.find(params.fetch("id_to_remove"))

    @job.destroy

    redirect_to("/contacts/#{@job.contact_id}", notice: "Job deleted successfully.")
  end

  def destroy_row
    @job = Job.find(params.fetch("id_to_remove"))

    @job.destroy

    redirect_to("/jobs", :notice => "Job deleted successfully.")
  end
end
