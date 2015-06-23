if ENV['AWS_REGION']
  S3_CLIENT = Aws::S3::Client.new
end
