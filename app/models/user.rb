class User < ApplicationRecord
	has_many :articles
	before_save { self.email = email.downcase }
	validates :username, presence: true,
				 length: {minimum: 3, maximum: 25},
				 format: { without: /\s/ }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

end
