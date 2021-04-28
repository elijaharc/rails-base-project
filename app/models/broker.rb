class Broker < ApplicationRecord
  has_many :broker_stocks, dependent: :destroy
  has_many :stocks, through: :broker_stocks
  belongs_to :admin
  validates :broker_name, presence: true
  validates :email, presence: true
  validates :admin_id, presence: true
  validates :account_type, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable

  def stock_already_added?(ticker_symbol, broker_id)
    stock = Stock.check_db(ticker_symbol, broker_id)
    return false unless stock

    stocks.exists?(id: stock.id, added_by: broker_id)
  end

  def can_add_stock?(ticker_symbol, broker_id)
    !stock_already_added?(ticker_symbol, broker_id)
  end

  def after_confirmation
    UserMailer.welcome_email(self).deliver
  end
end
