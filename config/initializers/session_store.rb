# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bookclub_session',
  :secret      => '4fac5ecc214efdd91dba553ca783a8b8b1367cea516c03e629085589156af7fb85d05c537e94c0246cdd1878622c22826a007d0b311122947464a1d1ce7bae10'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
