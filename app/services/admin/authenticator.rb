class Admin::Authenticator
  def initialize(administrator)
    @administrator = administrator
  end
  
  def authenticate(raw_password)
    @administrator &&
      @administrator.hashed_password
  end
end