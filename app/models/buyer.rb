class Buyer < ApplicationRecord
  belongs_to :admin
  has_many :buyer_stocks, :dependent => :destroy
  has_many :stocks, through: :buyer_stocks
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable

  def stock_already_bought?(stock_id, buyer_id)
    stock = BuyerStock.check_db(stock_id, buyer_id)
    return false unless stock
    BuyerStock.where(stock_id: stock_id, buyer_id: buyer_id).exists?
  end

  def can_buy_stock?(stock_id, broker_id)
    !stock_already_bought?(stock_id, broker_id)
  end
  
  def after_confirmation
    UserMailer.welcome_email(self).deliver
  end
end