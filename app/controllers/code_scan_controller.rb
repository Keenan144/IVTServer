class CodeScanController < ActionController::Base
  def scan_code_get 
    render text: "Success"
    Unit.new(unit_number: "get test").save
  end

  def scan_code_post
    render text: "Success"

    if  Unit.find_by(unit_number: params[:unit_number]) != nil 
      Unit.find_by(unit_number: params[:unit_number]).update(longitude: params[:longitude], username: params[:username], address: params[:address])
    else
      Unit.new(unit_number: params[:unit_number], longitude: params[:longitude], username: params[:username], address: params[:address]).save
    end

  end
end