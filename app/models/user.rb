class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable, :lockable, :timeoutable, :trackable

  
  with_options presence: true do
    validates :name
    validates :email, uniqueness: { case_sensitive: false },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :encrypted_password, length: { minimum: 6 }
  end

  validate :password_complexity
  validate :email_complexity

  def password_complexity
    return if password.blank? || password =~ /(?=.*?[a-z])(?=.*?[0-9])/
    errors.add :password, 'Complexity requirement not met. Please use: half-width characters'
  end

  def email_complexity
    return if email.blank? || email =~ /(?=.*?[@])/
    errors.add :email, 'Complexity requirement not met. Please use: @ characters'
  end

end
