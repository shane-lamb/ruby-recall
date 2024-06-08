# frozen_string_literal: true

require "active_record"

env = "development"
root_dir = File.expand_path("..", __dir__)
db_dir = __dir__
all_db_configs = YAML.safe_load_file(File.join(db_dir, "config.yml"))
db_config = all_db_configs[env]

# get database connection
ActiveRecord::Base.establish_connection(db_config)

# set up database tasks (migrations)
include ActiveRecord::Tasks
DatabaseTasks.root = root_dir
DatabaseTasks.env = env
DatabaseTasks.db_dir = db_dir
DatabaseTasks.database_configuration = all_db_configs
DatabaseTasks.migrations_paths = File.join(db_dir, "migrate")
