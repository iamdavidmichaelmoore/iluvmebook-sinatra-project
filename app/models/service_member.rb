class ServiceMember < ActiveRecord::Base
  has_many :books
  has_many :branches, through: :books
  has_secure_password
end
