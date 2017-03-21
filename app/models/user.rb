class User < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  has_many :branches

  has_secure_password
  validates :username, :email, presence: true, uniqueness: true
 
end