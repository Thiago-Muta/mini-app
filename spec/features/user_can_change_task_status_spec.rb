require 'rails_helper'

feature 'User can change task status' do

  scenario 'On the show page if user is the creator, from incomplete to complete' do
    user = create(:user)
    profile = create(:profile, user: user)
    login_as(user)
    task = create(:task, status: 'incomplete', user: user)

     visit task_path(task)
     click_on 'Edit Task'
     select 'complete'
     click_on 'Update Task'

     expect(Task.last.status).to eq('complete')
     expect(page).to have_content('Task Updated!')
  end

  scenario 'On the show page if user is the creator, from complete  to incomplete' do
    user = create(:user)
    profile = create(:profile, user: user)
    login_as(user)
    task = create(:task, status: 'complete', user: user)

     visit task_path(task)
     click_on 'Edit Task'
     select 'incomplete'
     click_on 'Update Task'

     expect(Task.last.status).to eq('incomplete')
     expect(page).to have_content('Task Updated!')
  end

end
