require "rails_helper"


describe SearchService do
  it "can retrieve house data from hogwarts service api" do
    results = SearchService.new("").jsonificus_house

    expect(results).to be_an(Array)
    expect(results.first["name"]).to eq("Gryffindor")
  end

  it "can retrieve house data from hogwarts service api" do
    results = SearchService.new("Gryffindor").jsonificus_students

    expect(results).to be_an(Array)
    expect(results.first["name"]).to eq("Albus Dumbledore")
  end
end
