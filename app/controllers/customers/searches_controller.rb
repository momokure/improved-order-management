class Customers::SearchesController < ApplicationController
  def index
    @customers = Customer.where('customer_name LIKE(?)', "%#{params[:customer_name]}%")

    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render json: @customers }
    end
  end
end