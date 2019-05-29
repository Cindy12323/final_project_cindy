ActiveAdmin.register Contact do

 permit_params :name, :email, :phone_number, :network, :company, :title, :work_location, :school_program, :school_section, :school_kwest, :first_met, :remarks
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
