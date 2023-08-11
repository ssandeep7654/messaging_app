class User < ApplicationRecord
  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where( ["lower(username) = :value OR lower(email) = :value", { value: login.strip.downcase}]).first
  end
end
