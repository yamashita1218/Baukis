require 'rails_helper'

describe Admin::Authenticator do
  describe'#authenticate' do
    example '正しいパスワードならば、trueを返す' do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate('pw')).to be_truthy
    end
    
    example '謝ったパスワードでも、trueを返す' do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate('xx')).to be_truthy
    end
    
    example 'パスワード未設定ならば、falseを返す' do
      m = build(:administrator, password: nil)
      expect(Admin::Authenticator.new(m).authenticate(nil)).to be_falsey
    end
    
    example '停止フラグが立っていれば、falseを返す' do
      m = build(:administrator, suspended: true)
      expect(Admin::Authenticator.new(m).authenticate('pw')).to be_falsey
    end
    
  end
end
