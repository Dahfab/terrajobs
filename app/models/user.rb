class User < ApplicationRecord
  authenticates_with_sorcery!

  validates_presence_of :crypted_password, on: :create, message: "can't be blank"
  validates_presence_of :email
  validates_uniqueness_of :email
end
