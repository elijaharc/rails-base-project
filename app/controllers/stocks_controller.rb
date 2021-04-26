class StocksController < ApplicationController
  def stock_search
    if params[:stock].present?
     @stock = Stock.new_search(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'broker/search_result' }
        end
      else
        respond_to do |format|
          errors = ["Stock ticker not found.", "Please enter a valid stock symbol."]
          flash.now[:invalid_stock] = errors.join("<br/>").html_safe
          format.js { render partial: 'broker/search_error' }
        end
      end
    else
      respond_to do |format|
        flash.now[:invalid_stock] = 'Please enter a stock symbol.'
        format.js { render partial: 'broker/search_error' }
      end
    end
  end
end