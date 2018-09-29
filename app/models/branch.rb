require_relative 'concerns/findable'

class Branch < ActiveRecord::Base

  include Findable::InstanceMethods
  
  has_many :books
  has_many :service_members, through: :books
end
