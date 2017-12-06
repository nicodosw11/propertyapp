module Admin::ApplicationHelper
  # def roles
  #   {
  #     'Manager' => 'manager',
  #     'Editor' => 'editor',
  #     'Viewer' => 'viewer'
  #   }
  # end
  # def roles
  #   hash = {}
  #   %w(manager editor viewer).each do |role|
  #     hash[role.titleize] = role
  #   end
  #   hash
  # end
  def roles
    hash = {}
    Role.available_roles.each do |role|
      hash[role.titleize] = role
    end
    hash
  end
end
