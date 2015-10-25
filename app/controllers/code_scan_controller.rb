class CodeScanController < ActionController::Base
  def scan_code_get 
    render text: "Success"
    Unit.new(unit_number: "get test").save
  end

  def scan_code_post
    render text: "Success"
    puts "!" * 100
    Unit.new(unit_number: params[:unit_number]).save

  end
end