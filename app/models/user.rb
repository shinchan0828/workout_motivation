class User < ApplicationRecord
  has_many :foodmenus, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :name, presence: true, length:{maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
  format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def feed
    Foodmenu.where("user_id = ?", id)
  end
end
