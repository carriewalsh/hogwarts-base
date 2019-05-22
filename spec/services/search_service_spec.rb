require "rails_helper"


describe SearchService do
  it "can retrieve house data from hogwarts service api" do
    results = SearchService.new("").jsonificus

    expect(results).to be_an(Array)
    expect(results.first["name"]).to eq("Gryffindor")
  end

  it "can retrieve house data from hogwarts service api" do
    results = SearchService.new(1).jsonificus

    expect(results).to be_an(Array)
    expect(results.first["name"]).to eq("Albus Dumbledore")
  end
end
