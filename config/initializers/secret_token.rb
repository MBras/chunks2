# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# Chunks2::Application.config.secret_key_base = 'a01a4c597f0b22b712145df8b93112a6a2e939d87e27965f3ab55dc4d6aee0200e693ddf3a6eb6dc0447a610ff5a48633d5a03d6a1f62f399e9262b0684d0464'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Chunks2::Application.config.secret_key_base = secure_token
