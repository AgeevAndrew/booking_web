# config valid only for current version of Capistrano
lock "3.9.1"

set :application, "booking_web"
set :repo_url, "git@github.com:LtdArink-Group/booking_web.git"
set :user, 'deployer'
# set :puma_threads, [4, 16]
# set :puma_workers, 1
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.4.1'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
# set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
# set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
# set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
# set :puma_access_log, "#{release_path}/log/puma.error.log"
# set :puma_error_log,  "#{release_path}/log/puma.access.log"
# set :puma_preload_app, true
# set :puma_worker_timeout, nil
# set :puma_init_active_record, true

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  desc "Make sure local git is in sync with remote."

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # invoke 'puma:restart'
      sudo 'service booking_web restart'
    end
  end

  after :finishing,     :cleanup
  # after :finishing,     :compile_ng4
  after :finishing,     :restart
end
