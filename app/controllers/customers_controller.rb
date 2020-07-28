class CustomersController < ApplicationController
  def new
    @customer = Customer.new
    @customer.customer_notes.build
  end

  def create
    customer = Customer.new(customer_params)
    customer.save
  end

  private
  def customer_params
    params.require(:customer).permit(:customer_name, :customer_furigana, :customer_type_id, customer_notes_attributes: [:customer_note])
  end
end
