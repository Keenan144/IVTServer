class CodeScanController < ActionController::Base
  def scan_code_get 
    render text: "Success"
  end

  def scan_code_post
    render text: "Success"
    render json: params
  end
end