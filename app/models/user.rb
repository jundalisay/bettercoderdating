class User < ActiveRecord::Base
  has_secure_password
  def self.authenticate(email, password)
    if user = find_by_email(email)
      return user
    end
    return nil
  end  
end
