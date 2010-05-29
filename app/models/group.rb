class Group < ActiveRecord::Base
  has_many :types,:dependent => :delete_all
    validates_uniqueness_of :name
    validates_presence_of :name
end
