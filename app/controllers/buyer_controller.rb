class BuyerController < ApplicationController
  before_action :authenticate_buyer!

  def index
  end
end
