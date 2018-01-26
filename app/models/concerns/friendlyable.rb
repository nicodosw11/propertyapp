module Friendlyable
  extend ActiveSupport::Concern
  included do
    extend ::FriendlyId
    before_create :set_hash_id
    friendly_id :hash_id
  end
  def set_hash_id
    hash_id = nil
    loop do
      random_id = SecureRandom.urlsafe_base64(4).gsub(/-|_/,('a'..'z').to_a[rand(26)])
      hash_id = [city, random_id].join("-")
      break unless self.class.name.constantize.where(:hash_id => hash_id).exists?
    end
    self.hash_id = hash_id
  end
end
