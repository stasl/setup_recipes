require 'capistrano'

Dir.glob(File.join(File.dirname(__FILE__), '/setup_recipes/*.rb')).sort.each { |f| require f }

module SetupRecipes
  VERSION = "0.0.1"
end
