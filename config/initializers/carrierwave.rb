CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAINCFZ6S4IRSNGEGA',       # required
    :aws_secret_access_key  => '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', #required                       # required
  }
  config.fog_directory  = 'ratemyclasses'            # required
  config.fog_public     = false                      # optional, defaults to true
  config.fog_authenticated_url_expiration = 600      # (in seconds) => 10 minutes
end