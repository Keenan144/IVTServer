class Unit < ActiveRecord::Base
  belongs_to :company

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |unit|
        csv << unit.attributes.values_at(*column_names)
      end
    end
  end
end
