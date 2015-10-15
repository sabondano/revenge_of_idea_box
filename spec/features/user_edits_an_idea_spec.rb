require 'rails_helper'

feature 'user edits an existing idea', js: true do
  scenario 'with valid input' do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here")

    visit root_path

    find(".btn-edit").click

    expect(page).to have_content("Edit Idea")
    expect(current_path).to eq(edit_idea_path(idea_1.id))

    fill_in :title, with: "The new title"
    fill_in :body, with: "The new body"
    click_button "Update"

    expect(page).to have_content("The new title")
    expect(page).to have_content("The new body")
  end
end
