Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "contacts#index"
  # Routes for the Contact resource:

  # CREATE
  get("/contacts/new", { :controller => "contacts", :action => "new_form" })
  post("/create_contact", { :controller => "contacts", :action => "create_row" })

  # READ
  get("/contacts", { :controller => "contacts", :action => "index" })
  get("/contacts/:id_to_display", { :controller => "contacts", :action => "show" })

  # UPDATE
  get("/contacts/:prefill_with_id/edit", { :controller => "contacts", :action => "edit_form" })
  post("/update_contact/:id_to_modify", { :controller => "contacts", :action => "update_row" })

  # DELETE
  get("/delete_contact/:id_to_remove", { :controller => "contacts", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
