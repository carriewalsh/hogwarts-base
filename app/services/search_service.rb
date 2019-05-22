class SearchService

  def initialize(house)
    @house = house
  end

  def conn(params)
    Faraday.new("https://hogwarts-as-a-service.herokuapp.com/api/v1/house/#{params}") do |f|
      f.headers["x_api_key"] = ENV["HOGWARTS_SERVICE_KEY_OF_MYSTERIES"]
      f.adapter Faraday.default_adapter
    end
  end

  def accio_houses
    conn("").get.body
  end

  def accio_students(house)
    conn("/#{accio_id(house)}").get.body
  end

  def jsonificus_students
    JSON.parse(accio_students(@house))
  end

  def jsonificus_house
    JSON.parse(accio_houses)
  end

  private

    def accio_id(param)
      houses = jsonificus_house
      @_id = nil
      houses.each do |house|
        if house["name"] == param
          @_id = house["id"]
        end
      end
      @_id
    end
end
