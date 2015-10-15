require 'rails_helper'

feature 'user thumbs up an idea from root', js: true do
  scenario 'from swill to plausible and plausible to genius' do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here")

    visit root_path

    expect(page).to have_content("swill")

    first(".glyphicon-thumbs-up").click

    expect(page).to have_content("plausible")
    expect(page).to_not have_content("swill")

    first(".glyphicon-thumbs-up").click

    expect(page).to have_content("genius")
    expect(page).to_not have_content("plausible")
  end
end
