class ActivitiesController < ApplicationController
  def index
    @q = Activity.ransack(params[:q])
    @activities = @q.result(:distinct => true).includes(:contact).page(params[:page]).per(10)

    render("activity_templates/index.html.erb")
  end

  def show
    @activity = Activity.find(params.fetch("id_to_display"))

    render("activity_templates/show.html.erb")
  end

  def new_form
    @activity = Activity.new

    render("activity_templates/new_form.html.erb")
  end

  def create_row
    @activity = Activity.new

    @activity.title = params.fetch("title")
    @activity.date = params.fetch("date")
    @activity.notes = params.fetch("notes")
    @activity.contact_id = params.fetch("contact_id")

    if @activity.valid?
      @activity.save

      redirect_back(:fallback_location => "/activities", :notice => "Activity created successfully.")
    else
      render("activity_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_contact
    @activity = Activity.new

    @activity.title = params.fetch("title")
    @activity.date = params.fetch("date")
    @activity.notes = params.fetch("notes")
    @activity.contact_id = params.fetch("contact_id")

    if @activity.valid?
      @activity.save

      redirect_to("/contacts/#{@activity.contact_id}", notice: "Activity created successfully.")
    else
      render("activity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @activity = Activity.find(params.fetch("prefill_with_id"))

    render("activity_templates/edit_form.html.erb")
  end

  def update_row
    @activity = Activity.find(params.fetch("id_to_modify"))

    @activity.title = params.fetch("title")
    @activity.date = params.fetch("date")
    @activity.notes = params.fetch("notes")
    @activity.contact_id = params.fetch("contact_id")

    if @activity.valid?
      @activity.save

      redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
    else
      render("activity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_contact
    @activity = Activity.find(params.fetch("id_to_remove"))

    @activity.destroy

    redirect_to("/contacts/#{@activity.contact_id}", notice: "Activity deleted successfully.")
  end

  def destroy_row
    @activity = Activity.find(params.fetch("id_to_remove"))

    @activity.destroy

    redirect_to("/activities", :notice => "Activity deleted successfully.")
  end
end
