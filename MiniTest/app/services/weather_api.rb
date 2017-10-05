class WeatherApi
  attr_reader :data

  def initialize(query)
    @query = query
    @data = Rails.cache.fetch("weather_api/#{@query}", expires_in: 12.hours) do
      get_and_parse request_uri
    end
  end

  def temperature
    @data['main']['temp']
  end

  def weather_conditions
    @data['weather']
  end

  private

  def get_and_parse(uri)
    JSON.parse Net::HTTP.get(uri)
  end

  def request_uri
    URI.parse "https://api.openweathermap.org/data/2.5/weather?q=#{@query}&appid=#{ENV['OPENWEATHER_KEY']}&units=metric"
  end
end