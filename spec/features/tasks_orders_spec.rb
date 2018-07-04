require 'rails_helper'

RSpec.feature "TasksOrders", type: :feature do
  
  describe '步驟11' do
    it '任務列表以建立時間排序' do
      first_task = Task.create(title: 'first_title', description: 'first_desc')
      new_task = Task.create(title: 'new_title', description: 'new_desc')
      visit '/tasks'
      expect(page.body.index(new_task.title)).to be < page.body.index(first_task.title)
    end
  end

end
