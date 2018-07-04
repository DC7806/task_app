require 'rails_helper'

RSpec.feature "TaskCruds", type: :feature do
  
  before do
    @first_task = Task.create(title: 'hello', description: 'world')
  end

  describe '步驟8' do
    
    it '新增任務' do      
      visit new_task_path
      fill_in 'task_title', with: 'hello'
      fill_in 'task_description', with: 'again'
      expect { click_button '確認送出' }.to change(Task, :count).by(1)
      expect(current_path).to eq tasks_path
      expect(page).to have_content('新增成功')
      expect(page).to have_content('hello', 'again')
    end

    it '修改任務' do
      visit edit_task_path(@first_task)
      fill_in 'task_title', with: 'HELLO'
      fill_in 'task_description', with: 'WORLD'
      click_button('確認送出')
      expect(page).to have_content('更新成功')
      expect(page).to have_content('HELLO', 'WORLD')
    end

    it '刪除任務' do
     visit tasks_path
     expect { click_link '刪除' }.to change(Task, :count).by(-1)
     expect(page).to have_content('刪除成功')
    end

  end

end