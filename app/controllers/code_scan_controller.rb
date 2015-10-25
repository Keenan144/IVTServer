class CodeScanController < ActionController::Base
  def scan_code_get 
    render text: "Success"
    Unit.new(unit_number: "get test").save
  end

  def scan_code_post
    render text: "Success"
    puts "!" * 100

    respond_to do |format|
      format.html { puts " html " }
      format.js    { puts " js "}
      format.xml  { puts "xml" }
    end
  end

end