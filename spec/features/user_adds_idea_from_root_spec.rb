require 'rails_helper'

feature 'user adds idea from root', js: true do
  scenario 'sees it without the page reloading' do
    visit root_path

    fill_in 'idea_title', with: 'The new idea'
    fill_in 'idea_body', with: 'the body of the new idea' 
    click_button 'Save'

    within('#ideas') do
      expect(page).to have_content('The new idea')
      expect(page).to have_content('the body of the new idea')
      expect(page).to have_content('quality: swill')
    end
  end

  scenario 'the text fields are cleared after saving it' do
    visit root_path

    fill_in 'idea_title', with: 'The new idea'
    fill_in 'idea_body', with: 'the body of the new idea' 
    click_button 'Save'

    expect(find('#idea_title').text).to eq('')
    expect(find('#idea_body').text).to eq('')
  end

  scenario 'the idea should still be present upon reloading' do
    visit root_path

    fill_in 'idea_title', with: 'The new idea'
    fill_in 'idea_body', with: 'the body of the new idea' 
    click_button 'Save'

    visit root_path

    within('#ideas') do
      expect(page).to have_content('The new idea')
      expect(page).to have_content('the body of the new idea')
      expect(page).to have_content('quality: swill')
    end
  end
end
