require 'rails_helper'

feature 'User can Create Task' do
  scenario 'Successfully' do
    user = create(:user)
    create(:profile, user: user, share: true)
    login_as(user)
    task = create(:task, user: user)

    visit new_task_path
    fill_in 'Title', with: 'New Title'
    fill_in 'Description', with: 'New Description'
    click_on 'Create Task'

    expect(Task.last.title).to eq('New Title')
    expect(Task.last.description).to eq('New Description')
    expect(page).to have_content('Task Created!')
  end

  scenario 'And must be loged in' do
    visit new_task_path
    expect(page).to have_content('You need to sign in before continuing.')
  end

  scenario 'And Title must have more than 4 characters' do
    user = create(:user)
    create(:profile, user: user, share: true)
    login_as(user)
    task = create(:task, user: user)

    visit new_task_path
    fill_in 'Title', with: 'New'
    fill_in 'Description', with: 'New Description'
    click_on 'Create Task'

    expect(page).to have_content('Title is short')
  end

  scenario 'And Title must have less than 20 characters' do
    user = create(:user)
    create(:profile, user: user, share: true)
    login_as(user)
    task = create(:task, user: user)

    visit new_task_path
    fill_in 'Title', with: 'Neeeeeeeeeeeeeeeeeeeeeeew'
    fill_in 'Description', with: 'New Description'
    click_on 'Create Task'

    expect(page).to have_content('Title is long')
  end

  scenario 'And Description Can\'t be blank' do
    user = create(:user)
    create(:profile, user: user, share: true)
    login_as(user)
    task = create(:task, user: user)

    visit new_task_path
    fill_in 'Title', with: 'New Title'
    fill_in 'Description', with: '   '
    click_on 'Create Task'

    expect(page).to have_content('Description Can\'t be blank')
  end
end
