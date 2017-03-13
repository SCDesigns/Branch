class User < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  has_many :branches
  validates_presence_of :username, :password, :email
  has_secure_password
end