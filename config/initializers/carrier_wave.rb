if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id =>    ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY'],
      :region => ENV['AWS_REGION'],
      :aws_signature_version => "AWS4-HMAC-SHA256"
    }
    config.cache_dir = "#{Rails.root}/tmp/uploads"                  

    config.fog_directory    = ENV['S3_BUCKET']
    # config.s3_access_policy = :public_read                         
    # config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET']}"
  end
end