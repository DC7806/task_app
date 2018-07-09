require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '步驟12' do
    
    it '資料驗證: 標題與內容必填(fail)' do
      # 標題
      no_title = Task.create(title: '', description: 'desc')
      expect(no_title).to be_invalid
      # 內容
      no_desc = Task.create(title: 'title', description: '')
      expect(no_desc).to be_invalid
    end

    it '資料驗證: 標題與內容必填(pass)' do
      passed_task = Task.create(title: 'xx', description: 'xx')
      expect(passed_task).to be_valid
    end

  end
end