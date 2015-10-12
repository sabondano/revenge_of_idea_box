require 'rails_helper'

RSpec.describe "view all ideas endpoint", type: :request do
  it "returns list of all existing ideas" do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here",
                         quality: "genius")
    idea_2 = Idea.create(title: "This is idea #2",
                         body: "The body of idea #2 should be here",
                         quality: "genius")

    get "/api/v1/ideas", format: :json
    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to              be_success
    expect(response).to             have_http_status(200)
    expect(body.count).to           eq(2)
    expect(body.first[:title]).to   eq(idea_1.title)
    expect(body.first[:body]).to    eq(idea_1.body)
    expect(body.first[:quality]).to eq(idea_1.quality)
    expect(body.last[:title]).to    eq(idea_2.title)
    expect(body.last[:body]).to     eq(idea_2.body)
    expect(body.last[:quality]).to  eq(idea_2.quality)
  end
end
