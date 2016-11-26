Clearance.configure do |config|
  config.routes = true
  config.allow_sign_up = false
  config.cookie_domain = ".example.com"
  config.cookie_expiration = ->(_cookies) { 1.year.from_now.utc }
  config.cookie_name = "remember_token"
  config.cookie_path = "/"
  config.httponly = false
  config.mailer_sender = "no_reply@hcsa.org.sg"
  config.password_strategy = Clearance::PasswordStrategies::BCrypt
  config.redirect_url = "/"
  config.secure_cookie = false
  config.sign_in_guards = []
  config.user_model = User
end
