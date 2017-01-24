$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require :default, ENV['RACK_ENV']

# Connecting all our framework's classes
Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each {|file| require file }


Dir[File.expand_path('../../api/v1/*.rb', __FILE__)].each {|file| require file }

require 'api'
require 'barebones_app'
require 'sequel'

Sequel::Model.plugin :timestamps, update_on_create: true

# Creating database context
db_config_file = File.join(File.dirname(__FILE__), "database.yml")
if File.exist?(db_config_file)

  config = YAML.load(File.read(db_config_file))
  DB = Sequel.connect(config['development'])
  Sequel.extension :migration
  # If there is a database connection, running all the migrations
  if DB
    Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), '..', 'db', 'migrations'))
  end
end


