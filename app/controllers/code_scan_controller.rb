class CodeScanController < ActionController::Base
  def scan_code_get 
    render text: "Success"
  end

  def scan_code_post
    render text: "Success"
    puts "!" * 100

  end
end