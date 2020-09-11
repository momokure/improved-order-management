class Pasteup::PDFController < ApplicationController
  def wicked
  respond_to do |format|
    # とりあえずデバッグモードで動かす
    format.html { redirect_to action: :show, format: :pdf, debug: true }
    format.pdf do
      render layout: 'mypage/sample_pdfs',
             pdf: 'sample',
             template: 'sample_pdfs/show.html',
             disposition: 'inline',
             page_size: 'A4',
             show_as_html: params.key?('debug')
      end
    end
  end
end
