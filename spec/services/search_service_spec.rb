require "rails_helper"


describe SearchService do
  it "can retrieve student data from Hotwarts api" do
    response = Faraday.get("http://hogwarts-it.herokuapp.com/api/v1/house/slytherin?api_key=#{ENV['HOGWARTS_KEY_OF_MYSTERIES']}")

    results = JSON.parse(response.body)["data"].first

    expect(results["attributes"]["name"]).to eq("Slytherin")
    expect(results["attributes"]["students"]).to be_an(Array)
    expect(results["attributes"]["students"].count).to eq(22)
    expect(results["attributes"]["students"].first["name"]).to eq("Gormlaith Gaunt")
    expect(results["attributes"]["students"].first["id"]).to eq(52)
  end
end
