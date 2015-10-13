require 'rails_helper'

RSpec.describe "thumbs down an idea endpoint", type: :request do
  it "thumbs down an existing idea and decreases quality 1 notch" do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here",
                         quality: "genius")
    idea_2 = Idea.create(title: "This is idea #2",
                         body: "The body of idea #2 should be here",
                         quality: "plausible")

    patch "/api/v1/ideas/#{idea_1.id}/thumbs-down"
    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(body[:quality]).to eq("plausible") 
    expect(idea_1.reload.quality).to eq("plausible")

    patch "/api/v1/ideas/#{idea_2.id}/thumbs-down"
    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(body[:quality]).to eq("swill") 
    expect(idea_2.reload.quality).to eq("swill")
  end

  it "doesnt change quality if swill quality idea thumbed down" do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here",
                         quality: "swill")

    patch "/api/v1/ideas/#{idea_1.id}/thumbs-down"
    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(body[:quality]).to eq("swill") 
    expect(idea_1.reload.quality).to eq("swill")
  end
end
