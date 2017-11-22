ActiveAdmin.register Deal do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :street, :city, :district, :postcode, :property_type, :occupancy, :funding_goal
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  column :id
  column :street
  column :city
  column :district
  column :postcode
  column :property_type
  column :occupancy
  column :funding_goal
  actions
end

end

