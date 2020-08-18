class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
    @customer.companies.build
    @customer.customer_emails.build
    @customer.customer_phone_numbers.build
    @customer.customer_addresses.build
    @customer.customer_notes.build
  end

  def create
    customer = Customer.new(customer_params)
    customer.save!
  end

  def show
    @customer = Customer.find_by(uid: params[:id])
  end

  private
  def customer_params
    params
      .require(:customer)
      .permit(
        :customer_name, :customer_furigana, :customer_type_id, :payment_method_id, :receipt_required,
        companies_attributes: [:company_name, :company_name_furigana,:_destroy],
        customer_emails_attributes: [:customer_email,:_destroy],
        customer_phone_numbers_attributes: [:customer_phone_number,:_destroy],
        customer_addresses_attributes: [:prefecture_code,:_destroy],
        customer_notes_attributes: [:customer_note, :_destroy]
      )
  end
end