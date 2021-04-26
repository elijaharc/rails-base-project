class Admin < ApplicationRecord
  has_many :brokers, dependent: :destroy
  has_many :buyers, dependent: :destroy
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :trackable, :timeoutable, :lockable
end
