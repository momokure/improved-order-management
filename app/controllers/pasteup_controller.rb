class PasteupController < ApplicationController
  require "date"
  before_action :set_params

  def toda1_silkscreen_a
    @order
  end

  def toda1_inkjet
  end

  def toda1_embroidery
    @order = Order.find_by(uid: params[:id])
    @customer = Customer.find(@order.customer_id)
    respond_to do |format|
      format.html
      format.pdf do
      render pdf: @order.uid+' '+@customer.customer_name,   # PDF名
        encording: 'UTF-8',
        template: 'pasteup/toda1_embroidery.html.haml' # viewを対象にする
      end
    end
  end

  def toda1_sewing
  end

  def bijogi_silkscreen_a
  end

  def bijogi_inkjet
  end

  def bijogi_embroidery
  end

  def bijogi_sewing
  end

  def bijogi_silkscreen_b
  end

  def bijogi_silkscreen_c
  end

  def bijogi_uv
  end

  def yoyogi_silkscreen_d
  end

  private
  def set_params
    @order = Order.find_by(uid: params[:id])
    @customer = Customer.find(@order.customer_id)
  end
end
