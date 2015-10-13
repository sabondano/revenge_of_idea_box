require 'rails_helper'

RSpec.describe "thumbs up an idea endpoint", type: :request do
  it "thumbs up an existing idea and increases quality 1 notch" do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here")
    idea_2 = Idea.create(title: "This is idea #2",
                         body: "The body of idea #2 should be here",
                         quality: "plausible")

    patch "/api/v1/ideas/#{idea_1.id}/thumbs-up"
    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(body[:quality]).to eq("plausible") 
    expect(idea_1.reload.quality).to eq("plausible")

    patch "/api/v1/ideas/#{idea_2.id}/thumbs-up"
    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(body[:quality]).to eq("genius") 
    expect(idea_2.reload.quality).to eq("genius")
  end

  it "doesnt change quality if genius quality idea thumbed up" do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here",
                         quality: "genius")

    patch "/api/v1/ideas/#{idea_1.id}/thumbs-up"
    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(body[:quality]).to eq("genius") 
    expect(idea_1.reload.quality).to eq("genius")
  end
end
