env = ENV['RACK_FLASH'] || 'development'

DataMapper.setup(:default, "postgres://localhost/oodls_#{env}")

DataMapper.auto_upgrade!

DataMapper.finalize