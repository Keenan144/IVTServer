class CodeScanController < ActionController::Base
  def scan_code_get 
    render text: "Success"
  end

  def scan_code_post
    render text: "Success"

    @unit = Unit.new(unit_number: params[:unit_number], longitude: params[:longitude], username: params[:username], address: params[:address]).save

    @unit.update(address: parse_address(@unit.address))
    parse_coordinates(@unit)

  end


    def parse_coordinates(coordinates)
      @unit = Unit.find(coordinates)
        if @unit.latitude == nil 
        p raw = @unit.longitude.split[1] 
        p @longitude = raw.split(",")[0] 
        p raw = @unit.longitude.split[1] 
        p @latitude = raw.split(",")[1]
        @latitude = @latitude.chomp('>')
        @unit.update(longitude: @longitude)
        @unit.update(latitude: @latitude)
      end
    end


  def parse_address(address)
    address = address.split(", ")
    address.each do |sub|
      if sub.split(': ')[0] == "CountryCode"
        @countryCode = sub.split(': ')[1]
        @countryCode.gsub!(/\W+/, '')
      elsif sub.split(': ')[0] == "ZIP"
        @zip = sub.split(': ')[1]
        @zip.gsub!(/\W+/, '')
      elsif sub.split(': ')[0] == "Street"
        @street = sub.split(': ')[1]
        @street.gsub!(/\W+/, '')
      elsif sub.split(': ')[0] == "State"
        @state = sub.split(': ')[1]
        @state.gsub!(/\W+/, '')
      elsif sub.split(': ')[0] == "City"
        @city = sub.split(': ')[1]
        @city.gsub!(/\W+/, '')
      end
    end
    @street + ", " + @city + " " + @state + ", " + @zip + " " + @countryCode
  end
end
