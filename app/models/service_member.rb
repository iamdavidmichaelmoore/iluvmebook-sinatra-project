  require_relative 'concerns/findable'

  class ServiceMember < ActiveRecord::Base

  include Findable::InstanceMethods
  
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

  def self.find_by_slug_and_id(slugged_name, user_id)
    self.all.detect {|n| n.slug == slugged_name && n.id == user_id}
  end

  def add_book(book)
    book.service_member = self unless book.service_member == self
    self.books << book unless self.books.include?(book)
  end
end
