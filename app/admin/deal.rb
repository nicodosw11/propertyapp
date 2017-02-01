ActiveAdmin.register Deal do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :description, :kind, :address, :image_url, :occupancy, :yield
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
  column :kind
  column :address
  column :created_at
  column :occupancy
  column :yield
  column :description
  column :image_url
  actions
end

end
