class ServiceMember < ActiveRecord::Base
  has_many :books
  has_many :branches, through: :books
  has_many :awards, through: :books
  has_secure_password

  def concatenated_name
    self.first_name + " " + self.last_name
  end
  
  def slug 
    self.concatenated_name.split(" ").join("-").downcase
  end

  def deslugged
    self.first_name + " " + self.last_name
  end

  def self.find_by_slug(slugged_name)
    self.all.detect {|n| n.slug == slugged_name}
  end
end
