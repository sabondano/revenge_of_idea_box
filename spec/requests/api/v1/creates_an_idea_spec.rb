require 'rails_helper'

RSpec.describe "create an idea endpoint", type: :request do
  it "creates an idea with valid parameters" do
    params = { idea: { title:   "New Idea",
                       body:    "the body of the idea" }
    }

    post "/api/v1/ideas", params
    body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to            be_success
    expect(response).to            have_http_status(200)
    expect(body[:title]).to        eq(params[:idea][:title])
    expect(body[:body]).to         eq(params[:idea][:body])
    expect(body[:quality]).to      eq("swill")
    expect(Idea.first.title).to    eq(params[:idea][:title])
    expect(Idea.first.body).to     eq(params[:idea][:body])
    expect(Idea.first.quality).to  eq("swill")
  end
end
