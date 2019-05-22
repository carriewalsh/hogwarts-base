require "rails_helper"


describe SearchService do
  it "can retrieve student data from Hotwarts api" do
    results = SearchService.new("slytherin").jsonificus

    expect(results["name"]).to eq("Slytherin")
    expect(results["students"]).to be_an(Array)
    expect(results["students"].count).to eq(22)
    expect(results["students"].first["name"]).to eq("Gormlaith Gaunt")
    expect(results["students"].first["id"]).to eq(52)
  end

  xit "can retrieve house data from hogwarts service api" do
    response = Faraday.new("https://hogwarts-as-a-service.herokuapp.com/api/v1/house") do |f|
      f.headers["x_api_key"] = ENV["HOGWARTS_SERVICE_KEY_OF_MYSTERIES"]
      f.adapter Faraday.default_adapter
    end
    data = response.get
    results = JSON.parse(data.body)

    expect(results).to be_an(Array)
    expect(results.first["name"]).to eq("Gryffindor")
  end

  xit "can retrieve house data from hogwarts service api" do
    response = Faraday.new("https://hogwarts-as-a-service.herokuapp.com/api/v1/house") do |f|
      f.headers["x_api_key"] = ENV["HOGWARTS_SERVICE_KEY_OF_MYSTERIES"]
      f.adapter Faraday.default_adapter
    end
    data = response.get
    results = JSON.parse(data.body)

    expect(results).to be_an(Array)
    expect(results.first["name"]).to eq("Gryffindor")
  end
end
