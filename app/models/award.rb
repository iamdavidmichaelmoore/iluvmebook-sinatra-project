class Award < ActiveRecord::Base
  has_many :books
  has_many :service_members, through: :books
end
