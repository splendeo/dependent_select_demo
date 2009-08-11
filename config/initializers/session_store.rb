# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dependent_select_demo_session',
  :secret      => '5108322f2490618864751f40869bc1c9e08afa4a17829920ca63395ebb3d6338277694aafed8c56668e93502071db99282cc6d5a7bd2415e2ffb60397a5b6b6f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
