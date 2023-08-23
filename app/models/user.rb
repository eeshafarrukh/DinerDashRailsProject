class User < ApplicationRecord
  def admin?
    # Implement your logic to determine if the user is an admin
    # For example, you might have an 'admin' boolean field in your users table
    admin # Replace 'admin' with the actual field name
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :full_name, presence: true
  validates :display_name, length: { minimum: 2, maximum: 32 }, allow_blank: true

end
