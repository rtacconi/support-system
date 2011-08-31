class User < ActiveRecord::Base
  # using tenacity here creates a bug
  # Mysql2::Error: Table 'support_development.issues_users' doesn't exist: delete from issues_users where user_id = 1
  # include Tenacity
  # t_has_many :issues
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
