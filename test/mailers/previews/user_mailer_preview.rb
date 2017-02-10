class UserMailerPreview < ActionMailer::Preview
  def welcome
    user = User.new(email: 'jackiesharp@hofc.com')
    # user = User.find_by_email("nicolas.dotto@hotmail.com")
    UserMailer.welcome(user)
  end
end
