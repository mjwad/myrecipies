class Chef<ApplicationRecord
  has_secure_password
  validates :name,presence: true, length: {maximum: 30}
  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true,length: {maximum: 255},format: {with: VALID_EMAIL_REGEX}
  has_many :recipes
  validates :password,presence: true,length: {minimum: 5}
end
