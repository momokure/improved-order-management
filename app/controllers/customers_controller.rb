class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
  end

  private
  def customer_params
    params.require(:customer).permit(:customer_name, :customer_furigana, :customers_type_id)
  end
end
