namespace :customers do
  namespace :db do
    task :load_config do
      root = Customers::Engine.root
      ActiveRecord::Tasks::DatabaseTasks.database_configuration = YAML.load_file(root + "config/database.yml")
      ActiveRecord::Tasks::DatabaseTasks.db_dir = root + 'db'
      ActiveRecord::Tasks::DatabaseTasks.migrations_paths = [ root + "db/migrate" ]
      ActiveRecord::Tasks::DatabaseTasks.root = root

      ActiveRecord::Base.configurations = ActiveRecord::Tasks::DatabaseTasks.database_configuration
      ActiveRecord::Migrator.migrations_paths = ActiveRecord::Tasks::DatabaseTasks.migrations_paths
    end
    
    desc "Create Customers DB"
    task create: :load_config do
      ActiveRecord::Tasks::DatabaseTasks.create_current
    end

    desc "Migrate Customers DB"
    task migrate: :load_config do
      ActiveRecord::Base.establish_connection ActiveRecord::Tasks::DatabaseTasks.env.to_sym
      ActiveRecord::Tasks::DatabaseTasks.migrate
    end
  end
end