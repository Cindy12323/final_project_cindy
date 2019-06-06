Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "contacts#index"
  # Routes for the Task resource:

  # CREATE
  get("/tasks/new", { :controller => "tasks", :action => "new_form" })
  post("/create_task", { :controller => "tasks", :action => "create_row" })
  post("/create_task_from_contact", { :controller => "tasks", :action => "create_row_from_contact" })

  # READ
  get("/tasks", { :controller => "tasks", :action => "index" })
  get("/tasks/:id_to_display", { :controller => "tasks", :action => "show" })

  # UPDATE
  get("/tasks/:prefill_with_id/edit", { :controller => "tasks", :action => "edit_form" })
  post("/update_task/:id_to_modify", { :controller => "tasks", :action => "update_row" })

  # DELETE
  get("/delete_task/:id_to_remove", { :controller => "tasks", :action => "destroy_row" })
  get("/delete_task_from_contact/:id_to_remove", { :controller => "tasks", :action => "destroy_row_from_contact" })

  #------------------------------

  # Routes for the Job resource:

  # CREATE
  get("/jobs/new", { :controller => "jobs", :action => "new_form" })
  post("/create_job", { :controller => "jobs", :action => "create_row" })
  post("/create_job_from_contact", { :controller => "jobs", :action => "create_row_from_contact" })

  # READ
  get("/jobs", { :controller => "jobs", :action => "index" })
  get("/jobs/:id_to_display", { :controller => "jobs", :action => "show" })

  # UPDATE
  get("/jobs/:prefill_with_id/edit", { :controller => "jobs", :action => "edit_form" })
  post("/update_job/:id_to_modify", { :controller => "jobs", :action => "update_row" })

  # DELETE
  get("/delete_job/:id_to_remove", { :controller => "jobs", :action => "destroy_row" })
  get("/delete_job_from_contact/:id_to_remove", { :controller => "jobs", :action => "destroy_row_from_contact" })

  #------------------------------

  # Routes for the Activity resource:

  # CREATE
  get("/activities/new", { :controller => "activities", :action => "new_form" })
  post("/create_activity", { :controller => "activities", :action => "create_row" })
  post("/create_activity_from_contact", { :controller => "activities", :action => "create_row_from_contact" })

  # READ
  get("/activities", { :controller => "activities", :action => "index" })
  get("/activities/:id_to_display", { :controller => "activities", :action => "show" })

  # UPDATE
  get("/activities/:prefill_with_id/edit", { :controller => "activities", :action => "edit_form" })
  post("/update_activity/:id_to_modify", { :controller => "activities", :action => "update_row" })

  # DELETE
  get("/delete_activity/:id_to_remove", { :controller => "activities", :action => "destroy_row" })
  get("/delete_activity_from_contact/:id_to_remove", { :controller => "activities", :action => "destroy_row_from_contact" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

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
  get("/delete_contact_from_user/:id_to_remove", { :controller => "contacts", :action => "destroy_row_from_user" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
