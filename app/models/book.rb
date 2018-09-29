require_relative 'concerns/findable'

class Book < ActiveRecord::Base

  include Findable::InstanceMethods
  
  belongs_to :service_member
  belongs_to :branch
  belongs_to :award
end
