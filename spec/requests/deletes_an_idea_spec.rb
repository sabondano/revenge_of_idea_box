require 'rails_helper'

RSpec.describe "delete an idea endpoint", type: :request do
  it "deletes an idea that already exists" do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here",
                         quality: "genius")
    idea_2 = Idea.create(title: "This is idea #2",
                         body: "The body of idea #2 should be here",
                         quality: "genius")

    delete "/api/v1/ideas/#{idea_1.id}"

    expect(response).to be_success
    expect(response).to have_http_status(204)
    expect(Idea.count).to eq(1)
    expect(Idea.first.id).to eq(idea_2.id)
  end
end
