class User < ApplicationRecord
	has_secure_password
	has_many :photos
	has_many :comments
	email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :city, presence: :true, length: { within: 2..25 }
	validates :email, presence: true, format: { with: email_regex }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
	validates :state, presence: :true, length: { is: 2 } 
	validates :age, presence: :true, numericality: { only_integer: true, greater_than_or_equal_to: 18, less_than: 100 }
	before_save :email_lowercase

	def email_lowercase
		email.downcase!
	end
	def has_password?(submitted_password)
		self.password == submitted_password
	end
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end
end
