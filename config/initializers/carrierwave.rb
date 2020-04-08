unless Rails.env.development? || Rails.env.test?
  require 'carrierwave/storage/abstract'
  require 'carrierwave/storage/file'
  require 'carrierwave/storage/fog'

  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1',
    }
  
    # 環境ごとにS3のバケットを指定
    case Rails.env
      when 'production'
        config.fog_directory  = 'fremar-product-image'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/fremar-product-image'
  
      when 'development'
        config.fog_directory  = 'fremar-product-image'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/fremar-product-image'
  
      when 'test'
        config.fog_directory  = 'fremar-product-image'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/fremar-product-image'
    end
  end



#   CarrierWave.configure do |config|
#     if Rails.env.development? || Rails.env.test?
#       config.storage = :file
#     else
#       config.storage = :fog
#       config.fog_provider = 'fog/aws'
#       config.fog_credentials = {
#         provider: 'AWS',
#         aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#         aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#         region: 'ap-northeast-1'
#       }
#       config.fog_directory  = 'fremar-product-image'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/fremar-product-image'
#     end
#   end
# end