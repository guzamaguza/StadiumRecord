require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
#config.i18n.default_locale = :de

use Rack::MethodOverride

use StadiumsController
use UsersController
use VisitsController
run ApplicationController
