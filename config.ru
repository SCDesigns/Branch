require './config/environment'
require './config/database'
require './app/controller/ApplicationController'
require './app'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use BranchesController
use UsersController
run ApplicationController
