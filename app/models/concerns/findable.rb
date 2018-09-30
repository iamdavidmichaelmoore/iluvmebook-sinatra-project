module Findable
  module ClassMethods
  end

  module InstanceMethods
    def deunderscore
      splits = self.gsub("_"," ").split(" ")
      splits.collect do |term|
        term.capitalize
      end
    end
  end
end