class ContactsController < ApplicationController
  def index
    @q = Contact.ransack(params[:q])
    @contacts = @q.result(:distinct => true).page(params[:page]).per(10)

    render("contact_templates/index.html.erb")
  end

  def show
    @contact = Contact.find(params.fetch("id_to_display"))

    render("contact_templates/show.html.erb")
  end

  def new_form
    @contact = Contact.new

    render("contact_templates/new_form.html.erb")
  end

  def create_row
    @contact = Contact.new

    @contact.name = params.fetch("name")
    @contact.email = params.fetch("email")
    @contact.phone_number = params.fetch("phone_number")
    @contact.network = params.fetch("network")
    @contact.company = params.fetch("company")
    @contact.title = params.fetch("title")
    @contact.work_location = params.fetch("work_location")
    @contact.school_program = params.fetch("school_program")
    @contact.school_section = params.fetch("school_section")
    @contact.school_kwest = params.fetch("school_kwest")
    @contact.first_met = params.fetch("first_met")
    @contact.remarks = params.fetch("remarks")

    if @contact.valid?
      @contact.save

      redirect_back(:fallback_location => "/contacts", :notice => "Contact created successfully.")
    else
      render("contact_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @contact = Contact.find(params.fetch("prefill_with_id"))

    render("contact_templates/edit_form.html.erb")
  end

  def update_row
    @contact = Contact.find(params.fetch("id_to_modify"))

    @contact.name = params.fetch("name")
    @contact.email = params.fetch("email")
    @contact.phone_number = params.fetch("phone_number")
    @contact.network = params.fetch("network")
    @contact.company = params.fetch("company")
    @contact.title = params.fetch("title")
    @contact.work_location = params.fetch("work_location")
    @contact.school_program = params.fetch("school_program")
    @contact.school_section = params.fetch("school_section")
    @contact.school_kwest = params.fetch("school_kwest")
    @contact.first_met = params.fetch("first_met")
    @contact.remarks = params.fetch("remarks")

    if @contact.valid?
      @contact.save

      redirect_to("/contacts/#{@contact.id}", :notice => "Contact updated successfully.")
    else
      render("contact_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @contact = Contact.find(params.fetch("id_to_remove"))

    @contact.destroy

    redirect_to("/contacts", :notice => "Contact deleted successfully.")
  end
end
