class Pasteup::SamplePdfsController < ApplicationController
  def wicked
  respond_to do |format|
    format.html
    format.pdf do
      render layout: 'layouts/wicked.html.haml',
             pdf: 'sample',
             template: 'orders/edit.html.haml',
             disposition: 'inline',
             page_size: 'A4'
      end
    end
  end
end
# def show
#     respond_to do |format|
#       format.html
#       format.pdf do
#         render pdf: 'file_name', #pdfファイルの名前。これがないとエラーが出ます
#                layout: 'pdf_layouts.html', #レイアウトファイルの指定。views/layoutsが読まれます。
#                template: 'things/show' #テンプレートファイルの指定。viewsフォルダが読み込まれます。
#       end
#     end
#   end
#
# def wicked
# respond_to do |format|
#   # とりあえずデバッグモードで動かす
#   format.html { redirect_to action: :show, format: :pdf, debug: true }
#   format.pdf do
#     render layout: 'pasteup/sample_pdfs',
#            pdf: 'sample',
#            template: 'sample_pdfs/show.html',
#            disposition: 'inline',
#            page_size: 'A4',
#            show_as_html: params.key?('debug')
#     end
#   end
# end
