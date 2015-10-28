module UnitsHelper

  def parse_address(address)
    p "address"
    street = address.split(',')[4]
    zip = address.split(',')[5] 
    city_state = address.split(',')[3]
    street.split(':')[1] + "," + city_state.split(':')[1] + zip.split(':')[1]
  end

  def is_flagged(unit)
    unit.flagged
  end
end


# "Optional(\"Optional([SubAdministrativeArea: Harris, CountryCode: US, SubLocality: IAH Airport Area, State: TX, Street: 3340 Greens Rd, ZIP: 77032, Name: 3340 Greens Rd, Thoroughfare: Greens Rd, FormattedAddressLines: (\\n    \\\"3340 Greens Rd\\\",\\n    \\\"Houston, TX  77032\\\",\\n    \\\"United States\\\"\\n), SubThoroughfare: 3340, PostCodeExtension: 2369, Country: United States, City: Houston])\")