class User < ApplicationRecord

	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	before_create :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		 																							BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost) 																							
	end

	def remember
		create_remember_token
		
	end

	def forget
		update_attribute(:remember_token, nil)
	end

	def authenticated?(attribute, token)
		digest = send("#{attribute}_token")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	private

	#def create_remember_token
	#	self.new_token = SecureRandom.urlsafe_base64
	#	update_attribute(:remember_token,  Digest::SHA1.hexdigest(remember_token.to_s))
	#end

  def create_remember_token
      self.remember_token = User.encrypt_token(User.get_token)
    end

    def User.get_token
      SecureRandom.urlsafe_base64
    end

    def User.encrypt_token(token)
      Digest::SHA1.hexdigest(token.to_s)
    end


end
