class User < ActiveRecord::Base
   #acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          
  


  def username
    return self.email.split('@'[0].capitalize)
  end
  
end
