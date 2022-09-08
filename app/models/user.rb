require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :name

  has_secure_password
  enum role: %w(default manager admin)

  def self.all_emails
    emails = []
    User.all.each do |user|
      emails << user.email
    end
    emails
  end

  def is_host
    user_parties.where("host = true")
  end

  def is_invited
    user_parties.where("host = false")
  end
end
