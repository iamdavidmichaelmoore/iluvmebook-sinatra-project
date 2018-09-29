require_relative 'concerns/findable'

class Award < ActiveRecord::Base

  include Findable::InstanceMethods
  
  has_many :books
  has_many :service_members, through: :books
end
