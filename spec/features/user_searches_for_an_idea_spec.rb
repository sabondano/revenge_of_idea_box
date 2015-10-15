require 'rails_helper'

feature 'user searches for an idea', js: true do
  scenario 'with query that should show one idea only' do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here")
    idea_2 = Idea.create(title: "This is idea #2",
                         body: "The body of idea #2 should be here")

    visit root_path

    fill_in :q, with: "#1"

    expect(page).to_not have_content(idea_2.title)
    expect(page).to_not have_content(idea_2.body)
    expect(page).to have_content(idea_1.title)
    expect(page).to have_content(idea_1.body)
  end

  scenario 'with query that should show two ideas' do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here")
    idea_2 = Idea.create(title: "This is idea #2",
                         body: "The body of idea #2 should be here")
    idea_3 = Idea.create(title: "yo yo ma",
                         body: "cello!!!")

    visit root_path

    fill_in :q, with: "idea"

    expect(page).to have_content(idea_1.title)
    expect(page).to have_content(idea_1.body)
    expect(page).to have_content(idea_2.title)
    expect(page).to have_content(idea_2.body)
    expect(page).to_not have_content(idea_3.title)
    expect(page).to_not have_content(idea_3.body)
  end

  scenario 'clearing the search box restores all the ideas on list' do
    idea_1 = Idea.create(title: "This is idea #1",
                         body: "The body of idea #1 should be here")
    idea_2 = Idea.create(title: "This is idea #2",
                         body: "The body of idea #2 should be here")

    visit root_path

    fill_in :q, with: "#1"

    expect(page).to_not have_content(idea_2.title)
    expect(page).to_not have_content(idea_2.body)
    expect(page).to have_content(idea_1.title)
    expect(page).to have_content(idea_1.body)

    fill_in :q, with: ""
    keypress_script = "var e = $.Event('keyup', { keyCode: 13 }); $('#q').trigger(e);"
    page.driver.execute_script(keypress_script)

    expect(page).to have_content(idea_2.title)
    expect(page).to have_content(idea_2.body)
    expect(page).to have_content(idea_1.title)
    expect(page).to have_content(idea_1.body)
  end
end
