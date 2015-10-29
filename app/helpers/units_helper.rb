module UnitsHelper

  def parse_address(address)
    p "======================================================================="
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

  def is_flagged(unit)
    unit.flagged
  end
end


# "Optional(\"Optional([SubAdministrativeArea: Harris, CountryCode: US, SubLocality: IAH Airport Area, State: TX, Street: 3340 Greens Rd, ZIP: 77032, Name: 3340 Greens Rd, Thoroughfare: Greens Rd, FormattedAddressLines: (\\n    \\\"3340 Greens Rd\\\",\\n    \\\"Houston, TX  77032\\\",\\n    \\\"United States\\\"\\n), SubThoroughfare: 3340, PostCodeExtension: 2369, Country: United States, City: Houston])\")