require 'rails_helper'

RSpec.feature "TasksOrders", type: :feature do
  
  let!(:first_task) { Task.create(title: 'first_title', description: 'first_desc', end_at: Time.now) }
  let!(:new_task) { Task.create(title: 'new_title', description: 'new_desc', end_at: Time.now + 1.day) }

  describe '步驟11' do
    it '任務列表以建立時間排序' do
      visit '/tasks'
      expect(page.body.index(new_task.title)).to be < page.body.index(first_task.title)
    end
  end

  describe '步驟14' do
    it '列表頁能夠以結束時間排序:首次點擊為desc排列，第二次點擊為asc排列，依此循環' do
      visit '/tasks'
      click_link I18n.t('activerecord.attributes.task.end_at')
      expect(page.body.index(new_task.title)).to be > page.body.index(first_task.title)
      click_link I18n.t('activerecord.attributes.task.end_at')
      expect(page.body.index(new_task.title)).to be < page.body.index(first_task.title)
    end
  end

end