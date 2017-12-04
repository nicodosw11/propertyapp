module AuthorizationHelpers
  def assign_role!(user, role, deal)
    Role.where(user: user, deal: deal).delete_all
    Role.create!(user: user, role: role, deal: deal)
  end
end

RSpec.configure do |c|
  c.include AuthorizationHelpers
end
