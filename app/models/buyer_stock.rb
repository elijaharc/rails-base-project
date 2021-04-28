class BuyerStock < ApplicationRecord
  belongs_to :buyer
  belongs_to :stock

  def self.check_db(stock_id, buyer_id)
    find_by(stock_id: stock_id, buyer_id: buyer_id)
  end

  def self.check_info(ticker)
    client = IEX::Api::Client.new(
      publishable_token: ENV["CLOUD_PUBLISHABLE_KEY"],
      secret_token: ENV["CLOUD_SECRET_KEY"],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
      company = client.company(ticker)
  end

end
