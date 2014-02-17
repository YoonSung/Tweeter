# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Tweeter::Application.config.secret_key_base = 'e599d590b857562ed270909cbeaac3dd1dfd623f3e679715cf864e70f283145d8894b3e09f9ae298677beaacd82b4fd4d4b74bcf54d97f9480c6e0a3d7aef8c0'

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

Tweeter::Application.config.secret_key_base = secure_token