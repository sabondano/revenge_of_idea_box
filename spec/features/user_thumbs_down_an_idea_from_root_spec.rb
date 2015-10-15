require 'rails_helper'

feature 'user thumbs down an idea from root', js: true do
  scenario 'from genius to plausible and plausible to swill' do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here",
                         quality: "genius")

    visit root_path

    expect(page).to have_content("genius")

    first(".glyphicon-thumbs-down").click

    expect(page).to have_content("plausible")
    expect(page).to_not have_content("genius")

    first(".glyphicon-thumbs-down").click

    expect(page).to have_content("swill")
    expect(page).to_not have_content("plausible")
  end
end
