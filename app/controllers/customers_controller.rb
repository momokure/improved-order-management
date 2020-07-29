class CustomersController < ApplicationController
  def new
    @customer = Customer.new
    @customer.companies.build
    @customer.customer_emails.build
    @customer.customer_phone_numbers.build
    @customer.customer_notes.build
  end

  def create
    customer = Customer.new(customer_params)
    customer.save
  end

  private
  def customer_params
    params.require(:customer).permit(:customer_name, :customer_furigana, :customer_type_id, :payment_method_id, :receipt_required_id, companies_attributes: [:company_name, :company_name_furigana, :payment_method, :invoice_required, :receipt_required], customer_emails_attributes: [:customer_email], customer_phone_numbers_attributes: [:customer_phone_number], customer_notes_attributes: [:customer_note])
  end
end