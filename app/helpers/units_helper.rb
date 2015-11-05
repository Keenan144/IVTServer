module UnitsHelper

  def parse_address(unit)
    unit = Unit.find(unit.id)
    if 
      address = unit.street.to_s + " " + unit.zip.to_s + " " + unit.city.to_s + " " + unit.state.to_s
      address
    else
      address = "address format cannot be read"
      address
    end
  end

  def is_flagged(unit)
    unit.flagged
  end
end


# "Optional(\"Optional([SubAdministrativeArea: Harris, CountryCode: US, SubLocality: IAH Airport Area, State: TX, Street: 3340 Greens Rd, ZIP: 77032, Name: 3340 Greens Rd, Thoroughfare: Greens Rd, FormattedAddressLines: (\\n    \\\"3340 Greens Rd\\\",\\n    \\\"Houston, TX  77032\\\",\\n    \\\"United States\\\"\\n), SubThoroughfare: 3340, PostCodeExtension: 2369, Country: United States, City: Houston])\")