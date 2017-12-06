RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :deletion
    DatabaseCleaner.clean_with(:deletion)
    #########################################
    # DatabaseCleaner.strategy = :transaction
    # DatabaseCleaner.clean_with(:truncation)
    #########################################
  end

  ###########################################
  # config.before(:suite) do
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  # config.before(:each) do
  #   DatabaseCleaner.strategy = :transaction
  # end

  # config.before(:each, :js => true) do
  #   DatabaseCleaner.strategy = :truncation
  # end
  ###########################################

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

