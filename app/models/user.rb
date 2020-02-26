
class User < ApplicationRecord

has_many :articles,dependent: :destroy
before_save { self.email = email.downcase }
validates :username, presence: true,

uniqueness: { case_sensitive: false },

length: { minimum: 8, maximum: 25 }

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :email, presence: true, length: {minimum: 12, maximum: 105 },

uniqueness: { case_sensitive: false },

format: { with: VALID_EMAIL_REGEX }

has_secure_password

PASSWORD_VALIDATOR = /(      # Start of group
        (?:                        # Start of nonmatching group, 4 possible solutions
          (?=.*[a-z])              # Must contain one lowercase character
          (?=.*[A-Z])              # Must contain one uppercase character
          (?=.*\W)                 # Must contain one non-word character or symbol
        |                          # or...
          (?=.*\d)                 # Must contain one digit from 0-9
          (?=.*[A-Z])              # Must contain one uppercase character
          (?=.*\W)                 # Must contain one non-word character or symbol
        |                          # or...
          (?=.*\d)                 # Must contain one digit from 0-9
          (?=.*[a-z])              # Must contain one lowercase character
          (?=.*\W)                 # Must contain one non-word character or symbol
        |                          # or...
          (?=.*\d)                 # Must contain one digit from 0-9
          (?=.*[a-z])              # Must contain one lowercase character
          (?=.*[A-Z])              # Must contain one uppercase character
        )                          # End of nonmatching group with possible solutions
        .*                         # Match anything with previous condition checking
      )/x                          # End of group

validates :password, {confirmation: true, presence: true, 
	length: { minimum: 8 }, 
	format: {
        with: PASSWORD_VALIDATOR,
        message: "must contain 3 of the following 4:
         a lowercase letter, an uppercase letter, a digit,
          a non-word character or symbol"
        }
    }



end