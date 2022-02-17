require 'rails_helper'

feature 'User can Delete Tasks' do
  scenario 'If user is the creator, Successfully' do
    user = create(:user)
    create(:profile, user: user, share: true)
    login_as(user)
    task = create(:task, user: user)

    visit task_path(task)
    click_on 'Delete'

    expect(page).to have_content('Task Deleted!')
  end

  scenario 'If user is the creator, And Must be loged in' do
    task = create(:task, user: user)
    visit task_path(task)

    expect(page).to have_content('You need to sign in before delete.')
  end
end
