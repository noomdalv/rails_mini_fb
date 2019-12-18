class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                  format: {with: VALID_EMAIL_REGEX},
                  uniqueness: {case_sensitive: false},
                  length: {minimum: 10, maximum: 255}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
