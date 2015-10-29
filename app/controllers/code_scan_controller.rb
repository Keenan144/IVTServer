class CodeScanController < ActionController::Base
  def scan_code_get 
    render text: "Success"
  end

  def scan_code_post
    render text: "Success"

    Unit.new(unit_number: params[:unit_number], longitude: params[:longitude], username: params[:username], address: params[:address]).save

  end
end
