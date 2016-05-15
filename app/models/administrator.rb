class Administrator < ActiveRecord::Base
  include EmailHolder
  include PasswordHolder
  
  def suspended?
    self.suspended
  end

  def active?
    !suspended?
  end  
end
