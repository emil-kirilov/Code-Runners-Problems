module UsersHelper
 def self.authenticate(email, password)
    user = User.find_by(email)

    return nil if user.nil?
    return user if user.has_password?(password)
  end
end