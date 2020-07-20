# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "improved-order-management"
set :repo_url, "git@github.com:hanaharafumiki/improved-order-management.git"
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :ssh_options, auth_methods: ['publickey'], keys: ['~/.ssh/hanaharafumiki.pem'] 
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5
set :bundle_flags, "--quiet --binstubs --shebang ruby-local-exec"

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
