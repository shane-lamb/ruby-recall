require "active_record"

# This task is invoked to set up the DB environment/connection,
# as a dependency for tasks that need to interact with the DB
task :environment do
  # Setup code shared between the app and rake tasks to initialise the DB and migrator
  require_relative "db/init"
end

# Load all the tasks provided by the ActiveRecord gem
load "active_record/railties/databases.rake"

# The ActiveRecord gem doesn't provide a task to generate/create new migration files.
# Therefore, this is a hand-rolled task that generates migrations similarly to vanilla Rails.
namespace :g do
  desc "Generate migration"
  task :migration do
    name = ARGV[1] || raise("Specify name: rake g:migration your_migration")
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split("_").map(&:capitalize).join

    File.write(path, <<~EOF)
      class #{migration_class} < ActiveRecord::Migration[7.1]
        def change
        end
      end
    EOF

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end
