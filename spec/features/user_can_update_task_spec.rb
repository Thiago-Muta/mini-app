require 'rails_helper'

feature 'User can edit Tasks' do
  scenario 'If user is the creator, Successfully' do
    user = create(:user)
    create(:profile, user: user, share: true)
    login_as(user)
    task = create(:task, user: user)

    visit reports_path
    click_on 'show task'
    click_on 'Edit Task'
    fill_in 'Title', with: 'Another Title'
    fill_in 'Description', with: 'Another Description'

    expect(Task.last.title).to eq('Another Title')
    expect(Task.last.description).to eq('Another Description')
    expect(page).to have_content('Task Updated!')
  end

  scenario 'If user is the creator, And must fill all fields' do
    user = create(:user)
    create(:profile, user: user, share: true)
    login_as(user)
    task = create(:task, user: user)

    visit reports_path
    click_on 'show task'
    click_on 'Edit Task'

    fill_in 'Title', with: 'Another Title'
    fill_in 'Description', with: '   '

    expect(page).to have_content('Task Not Updated!')
  end
end
