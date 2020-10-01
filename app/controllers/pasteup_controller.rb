class PasteupController < ApplicationController
  require "date"
  before_action :set_params
  @@d = Date.today
  $thisyear

  def toda1_silkscreen_a
    @order
  end

  def toda1_inkjet
    @order = Order.find_by(uid: params[:id])
    @customer = Customer.find(@order.customer_id)
    respond_to do |format|
      format.html
      format.pdf do
      render pdf: @order.uid+' '+@customer.customer_name+' 戸田1 ink'+@@d.year.to_s,   # PDF名
        encording: 'UTF-8',
        template: 'pasteup/toda1_inkjet.html.haml' # viewを対象にする
      end
    end
  end

  def toda1_embroidery
    d = Date.today
    @order = Order.find_by(uid: params[:id])
    @customer = Customer.find(@order.customer_id)
    respond_to do |format|
      format.html
      format.pdf do
      render pdf: @order.uid+' '+@customer.customer_name+' 戸田1 emb'+@@d.year.to_s,   # PDF名
        encording: 'UTF-8',
        template: 'pasteup/toda1_embroidery.html.haml', # viewを対象にする
        page_size: 'A4',
               margin: { top: 2,
                         bottom: 0,
                         left: 0,
                         right: 0 },
                        #outline: {   outline:           true,
                        #    outline_depth:     LEVEL },
        show_as_html: params[:debug].present? # debug するか？
      end
    end
  end

  def toda1_sewing
    @order = Order.find_by(uid: params[:id])
    @customer = Customer.find(@order.customer_id)
    respond_to do |format|
      format.html
      format.pdf do
      render pdf: @order.uid+' '+@customer.customer_name,   # PDF名
        encording: 'UTF-8',
        template: 'pasteup/toda1_sewing.html.haml' # viewを対象にする
      end
    end
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
