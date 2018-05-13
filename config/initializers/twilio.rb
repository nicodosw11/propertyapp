Twilio.configure do |config|
  config.account_sid = ENV['MY_TWILIO_SID']
  config.auth_token = ENV['MY_TWILIO_TOKEN']
end
