CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAI7II5WYAO5QL5AUQ',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.fog_directory = 'pimagepro'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/pimagepro'

    when 'development'
      config.fog_directory = 'pimagedev'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/pimagedev'

    when 'test'
      config.fog_directory = 'pimagetest'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/pimagetest'
  end
end