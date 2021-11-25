class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :storages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
