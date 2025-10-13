# Load environment-specific seeds
env_seed_file = Rails.root.join('db', 'seeds', "#{Rails.env}.rb")
if File.exist?(env_seed_file)
  load env_seed_file
end
