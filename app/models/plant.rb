class Plant < ApplicationRecord
  validates_presence_of :species, :frequency
  belongs_to :garden

  def self.plants_that_need_watering
    Plant.select("plants.*, (EXTRACT(EPOCH FROM ((NOW()) - (last_watered))) - (frequency - 6) * 3600) as needing_water").where("EXTRACT(EPOCH FROM ((NOW()) - (last_watered))) > (frequency - 6) * 3600").order('needing_water desc')
  end

  def hours_since_watered
    ((Time.now - last_watered) / 3600).round
  end

  def hours_until_watering
    ((last_watered + frequency * 60.0 * 60 - Time.now) / 3600).round
  end
end
