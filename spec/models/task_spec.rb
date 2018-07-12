require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '步驟12' do
    
    it '資料驗證: 標題與內容必填(fail)' do
      # 標題
      no_title = Task.create(title: '', description: 'desc', end_at: Time.now)
      expect(no_title).to be_invalid
      # 內容
      no_desc = Task.create(title: 'title', description: '', end_at: Time.now)
      expect(no_desc).to be_invalid
    end

    it '資料驗證: 標題與內容必填(pass)' do
      passed_task = Task.create(title: 'xx', description: 'xx', end_at: Time.now)
      expect(passed_task).to be_valid
    end

  end

  describe '步驟14' do
    
    it '資料驗證: 結束時間必填(fail)' do
      no_end_at = Task.create(title: 'title', description: 'desc', end_at: '')
      expect(no_end_at).to be_invalid
    end

    it '資料驗證: 結束時間必填(pass)' do
      end_at = Task.create(title: 'title', description: 'desc', end_at: Time.now)
      expect(end_at).to be_valid
    end

  end
end