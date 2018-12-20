# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  email              :string(255)
#  encrypted_password :string(255)
#  salt               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require "bcrypt"

class User < ApplicationRecord
  attr_accessor :password, :password_confirmation

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates_length_of :password, minimum: 6, on: :create
  validate :passwords_match

  before_save :encrypt_password
  after_save :clear_password

  def admin?
    # Stub this for now
    true
  end

  def name
    "#{first_name} #{last_name}"
  end

  def validate_password(password)
    BCrypt::Engine.hash_secret(password, salt) == encrypted_password
  end

  private

  def passwords_match
    return true unless password || password_confirmation
    password == password_confirmation
  end

  def clear_password
    self.password = nil
  end

  def encrypt_password
    return unless password.present?

    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
  end
end
