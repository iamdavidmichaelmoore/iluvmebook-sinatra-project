class Book < ActiveRecord::Base
  belongs_to :service_member
  belongs_to :branch
end
