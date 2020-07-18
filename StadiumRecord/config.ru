require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
#config.i18n.default_locale = :de

#Mount Controllers below.
#the rack line allows us to send patch, delete, etc. requests


use Rack::MethodOverride
use VisitsController
use ArenasController
use UsersController
run ApplicationController
