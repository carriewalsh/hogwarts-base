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
end
