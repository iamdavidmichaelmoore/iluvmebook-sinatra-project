require_relative 'concerns/findable'

class Book < ActiveRecord::Base

  include Findable::InstanceMethods
  
  belongs_to :service_member
  belongs_to :branch
  has_many :awards

  def add_award(award)
    award.books << self unless award.books.include?(self)
    self.awards << award unless self.awards.include?(award)
  end
end
