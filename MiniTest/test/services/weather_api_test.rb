require 'test_helper'

class WeatherApiTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette("moscow weather") do
      @weather = WeatherApi.new 'Moscow,ru'
    end
  end

  test 'it should return temperature' do
    assert_equal 8, @weather.temperature
  end

  test 'it should return weather conditions' do
    weather_condition = @weather.weather_conditions.first
    assert_equal 'Rain', weather_condition['main']
    assert_equal 'light intensity shower rain', weather_condition['description']
  end
end