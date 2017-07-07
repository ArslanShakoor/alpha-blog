class User < ActiveRecord::Base
	has_many :articles, dependent: :destroy

	validates :username, presence: true, 
	          uniqueness:{case_sensitive: false},
	          length:{minimum: 8, maximum: 25}

	VALID_EMAIL_REGEX= /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i         
	validates :email, presence: true,
	          uniqueness:{case_sensitive: false},
	          length:{ maximum: 125 },
	          format: { with: VALID_EMAIL_REGEX }

	has_secure_password          
end
