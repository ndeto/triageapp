# Loading an environment
require_relative './config/environment'
# When I use tux:
# require './config/environment'
#
Dir.glob('./{app/controllers}/*.rb') { |file| require file }

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


# Starting Application
use Rack::MethodOverride
use ReviewController
use NurseController
run ApplicationController
use EvaluationsController
use PatientsController
