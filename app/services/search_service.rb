class SearchService

  def initialize(id)
    @id = id
  end

  def conn(params)
    Faraday.new("https://hogwarts-as-a-service.herokuapp.com/api/v1/house/#{params}") do |f|
      f.headers["x_api_key"] = ENV["HOGWARTS_SERVICE_KEY_OF_MYSTERIES"]
      f.adapter Faraday.default_adapter
    end
  end

  def accio_houses
    conn("").get
  end

  def accio_students(id)
    conn("/#{id}").get
  end

  def jsonificus
    if @id.nil?
      JSON.parse(accio_houses.body)
    else
      binding.pry
      JSON.parse(accio_students(@id).body)
    end
  end
end
