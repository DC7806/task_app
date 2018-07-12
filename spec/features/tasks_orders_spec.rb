require 'rails_helper'

RSpec.feature "TasksOrders", type: :feature do
  
  let!(:first_task) { Task.create(title: 'first_title', description: 'first_desc', end_at: Time.now, status: 0, priority: 0) }
  let!(:new_task) { Task.create(title: 'new_title', description: 'new_desc', end_at: Time.now + 1.day, status: 1, priority: 1) }

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

  describe '步驟15' do
    it '依任務名稱以及狀態查詢' do
      # sort by title
      visit '/tasks'
      fill_in 'q_title_cont', with: 'first_title'
      click_button(I18n.t('buttons.search'))
      expect(page).to have_content(first_task.title)
      expect(page).to have_no_content(new_task.title)
      
      # show all
      click_link(I18n.t('buttons.show_all'))
      
      # sort by status
      page.select(I18n.t('activerecord.attributes.task/statuses.pending'))
      click_button(I18n.t('buttons.search'))
      expect(page).to have_content(first_task.title)
      expect(page).to have_no_content(new_task.title)
      
      # show all
      click_link(I18n.t('buttons.show_all'))
      
      # sort by title and status
      fill_in 'q_title_cont', with: 'title'
      click_button(I18n.t('buttons.search'))
      expect(page).to have_content(first_task.title) 
      expect(page).to have_content(new_task.title)
      page.select(I18n.t('activerecord.attributes.task/statuses.pending'))
      click_button(I18n.t('buttons.search'))
      expect(page).to have_content(first_task.title)
      expect(page).to have_no_content(new_task.title)
    end
  end

  describe '步驟16' do
    it '能夠以優先順序做排序' do
      visit '/tasks'
      click_link(I18n.t('activerecord.attributes.task.priority'))
      expect(page.body.index(first_task.title)).to be < page.body.index(new_task.title)
      click_link(I18n.t('activerecord.attributes.task.priority'))
      expect(page.body.index(first_task.title)).to be > page.body.index(new_task.title)
    end
  end

end