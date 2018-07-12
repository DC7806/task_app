require 'rails_helper'

RSpec.feature "TaskCruds", type: :feature do
  
  let!(:first_task) { Task.create(title: 'hello', description: 'world', end_at: Time.now) }

  describe '步驟8' do
    
    it '新增任務' do      
      visit new_task_path
      fill_in 'task_title', with: 'hello'
      fill_in 'task_description', with: 'again'
      expect { click_button I18n.t('buttons.submit') }.to change(Task, :count).by(1)
      expect(current_path).to eq tasks_path
      expect(page).to have_content(I18n.t('crud.create_success', resource: Task.model_name.human))
      expect(page).to have_content('hello', 'again')
    end

    it '修改任務' do
      visit edit_task_path(first_task)
      fill_in 'task_title', with: 'HELLO'
      fill_in 'task_description', with: 'WORLD'
      click_button(I18n.t('buttons.submit'))
      expect(page).to have_content(I18n.t('crud.update_success', resource: Task.model_name.human))
      expect(page).to have_content('HELLO', 'WORLD')
    end

    it '刪除任務' do
      visit tasks_path
      expect { click_link I18n.t('buttons.destroy') }.to change(Task, :count).by(-1)
      expect(page).to have_content(I18n.t('crud.destroy_success', resource: Task.model_name.human))
    end

  end

  describe '步驟12' do
    it '在頁面上加入驗證的錯誤訊息' do
      visit new_task_path
      click_button I18n.t('buttons.submit')
      expect(page).to have_content(I18n.t('activerecord.errors.messages.blank'))
    end
  end

end