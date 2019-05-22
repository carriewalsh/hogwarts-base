class SearchService

  def initialize(house)
    @house = house
  end

  def conn(house)
    Faraday.get("http://hogwarts-it.herokuapp.com/api/v1/house/#{house}?api_key=#{ENV['HOGWARTS_KEY_OF_MYSTERIES']}")
  end

  def jsonificus
    JSON.parse(conn(@house).body)["data"].first["attributes"]
  end
end
