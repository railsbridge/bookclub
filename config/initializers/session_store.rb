# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bookclub_session',
  :secret      => '1ecb6459c934dd12dfcb2e3dd2035b6f265e5dd4b6b074cb2366efa2254192327a4e9e6c0c112698f73a1a49b63867f0f3b810e6f3279b4d45b01dcca641d896'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
