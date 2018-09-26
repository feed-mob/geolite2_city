require "test_helper"
require "maxminddb"

class Geolite2CityTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Geolite2City::VERSION
  end

  def test_that_the_file_is_parsable
    db = MaxMindDB.new(GeoLite2City::DB_PATH)
    data = db.lookup("74.125.225.224")
    refute_nil data.country.name
  end
end
