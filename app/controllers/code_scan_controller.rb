class CodeScanController < ActionController::Base
  def scan_code_get 
    render text: "Success"
  end

  def scan_code_post
    render text: "Success"

    Unit.new(unit_number: params[:unit_number], longitude: params[:longitude], username: params[:username], address: params[:address]).save

    @unit = Unit.last
    parse_address(@unit)
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


  def parse_address(unit)
    @unit = Unit.find(unit)

    address = @unit.address
    address = address.split(", ")
    address.each do |sub|
      if sub.split(': ')[0] == "CountryCode"
        @countryCode = sub.split(': ')[1]
        @countryCode.gsub!(/\W+/, '')
        @unit.update(countryCode: @countryCode)
      elsif sub.split(': ')[0] == "ZIP"
        @zip = sub.split(': ')[1]
        @zip.gsub!(/\W+/, '')
        @unit.update(zip: @zip)
      elsif sub.split(': ')[0] == "Street"
        @street = sub.split(': ')[1]
        @street.gsub!(/\W+/, '')
        @unit.update(street: @street)
      elsif sub.split(': ')[0] == "State"
        @state = sub.split(': ')[1]
        @state.gsub!(/\W+/, '')
        @unit.update(state: @state)
      elsif sub.split(': ')[0] == "City"
        @city = sub.split(': ')[1]
        @city.gsub!(/\W+/, '')
        @unit.update(city: @city)
      end
    end
  end
end
