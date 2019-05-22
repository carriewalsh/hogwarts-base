require "rails_helper"


describe SearchService do
  it "can retrieve student data from Hotwarts api" do
    body = Faraday.get("http://hogwarts-it.herokuapp.com/api/v1/house/slytherin?api_key=#{ENV["HOGWARTS_KEY_OF_MYSTERIES"]}")
    data = JSON.parse(body)
    expect()
  end
end
