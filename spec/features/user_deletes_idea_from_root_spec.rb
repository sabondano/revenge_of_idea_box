require 'rails_helper'

feature 'user deletes idea from root', js: true do
  scenario 'upon clicking delete, the idea is removed' do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here")
    idea_2 = Idea.create(title: "This is idea #2",
                         body: "The body of idea #2 should be here",
                         quality: "genius")
    visit root_path

    first(".btn-delete").click

    expect(page).to_not have_content("This is idea #2")
    expect(page).to_not have_content("The body of idea #2 should be here")
    expect(page).to_not have_content("genius")
  end

  scenario 'the deleted idea does not appear on the next page load' do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here")
    idea_2 = Idea.create(title: "This is idea #2",
                         body: "The body of idea #2 should be here",
                         quality: "genius")

    visit root_path

    first(".btn-delete").click

    visit root_path

    expect(page).to_not have_content("This is idea #2")
    expect(page).to_not have_content("The body of idea #2 should be here")
    expect(page).to_not have_content("genius")
  end
end
