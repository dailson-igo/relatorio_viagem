# Require all Ruby files in the core_extensions directory
Dir[Rails.root.join('lib', 'minhas_extensoes', '*.rb')].each { |f| require f }

# Apply the monkey patches
String.include MinhasExtensoes::String
