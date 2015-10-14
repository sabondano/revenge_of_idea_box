require 'rails_helper'

feature 'user sees all existing ideas', js: true do
  scenario 'including title, body, and quality for each' do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here")
    idea_2 = Idea.create(title: "This is idea #2",
                         body: "The body of idea #2 should be here",
                         quality: "genius")

    visit root_path

    expect(current_path).to eq("/")
    expect(page).to have_content(idea_1.title)
    expect(page).to have_content(idea_1.body)
    expect(page).to have_content("swill")
    expect(page).to have_content(idea_2.title)
    expect(page).to have_content(idea_2.body)
    expect(page).to have_content(idea_2.quality)
  end

  scenario 'if body is longer than 100 characters it gets truncated' do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "This is the body of the idea and it is more" \
                               " than 100 characters long long long long" \
                               "long long last long")

    visit root_path

    expect(page).to_not have_content(idea_1.body)
    expect(page).to have_content("This is the body of the idea and it is more" \
                                       " than 100 characters long long long long" \
                                       "long long last")
  end
end
