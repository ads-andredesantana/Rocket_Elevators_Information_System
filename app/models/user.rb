class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable 
  acts_as_token_authenticatable
  belongs_to :employees
end