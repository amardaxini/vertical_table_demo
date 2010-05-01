# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_compare_india_session',
  :secret      => 'b9124786b7b7e94157b5bb99abfe7b783dd8bba7ae4c3108fff0cdfb529c596660d02348f6a0c8c86532973eccbc03b74441e0f25b63c6d3789ab67854bd04fe'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
