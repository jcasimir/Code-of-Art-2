# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tabler_session',
  :secret      => '28bf60490308c132b34ef5d464d886b69352cb6d40d95457c44d074c2ad0d109c6093e65746ba0317387e98306e21e93d50993edcbf95c4d2bdd8b938f17c4f6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
