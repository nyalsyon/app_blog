ActiveAdmin.register User do
permit_params :email
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

action_item do
  link_to 'Invite New User', new_invitation_admin_users_path
end

collection_action :new_invitation do
	@user = User.new
end 

collection_action :send_invitation, :method => :post do
	@user = User.invite!(params[:user], current_user)
	if @user.errors.empty?
		flash[:success] = "User has been successfully invited." 
		redirect_to admin_users_path
	else
		messages = @user.errors.full_messages.map { |msg| msg }.join
		flash[:error] = "Error: " + messages
		redirect_to new_invitation_admin_users_path
	end
end
end
