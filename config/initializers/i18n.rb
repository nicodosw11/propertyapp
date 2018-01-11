# Where the I18n library should search for translation files
# I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

# Whitelist locales available for the application
I18n.available_locales = [:fr, :en]

# Set default locale to something other than :en
# I18n.default_locale = :pt
#encoding: utf-8
I18n.default_locale = :fr

LANGUAGES = [
  ["Français".html_safe, 'fr'],
  ['English','en']
]


