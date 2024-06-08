require "active_record"

task :environment do
  require_relative "db/init"
end

load "active_record/railties/databases.rake"

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
