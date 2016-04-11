require 'rails_helper'

describe Staff::Authenticator do
  describe'#authenticate' do
    example '正しいパスワードならば、trueを返す' do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_truthy
    end
    
    example '謝ったパスワードならば、falseを返す' do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate('xx')).to be_falsey
    end
    
    example 'パスワード未設定ならば、falseを返す' do
      m = build(:staff_member, password: nil)
      expect(Staff::Authenticator.new(m).authenticate(nil)).to be_falsey
    end
    
    example '停止フラグが立っていても、trueを返す' do
      m = build(:staff_member, suspended: true)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_truthy
    end
    
    example '開始前ならば、falseを返す' do
      m = build(:staff_member, start_date: Date.tomorrow)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
    end
    
    example '終了後ならば、falseを返す' do
      m = build(:staff_member, end_date: Date.today)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
    end
    
  end
end
