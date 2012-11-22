require "rvm/capistrano"
require "bundler/capistrano"
require "delayed/recipes"

set :application, "badges.matehackers.org"
set :repository,  "/home/lucas/prog/matehackers/matebadges/"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :scm, :git

set :deploy_via, :remote_cache
set :ssh_options, {:forward_agent => true}

set :deploy_to, '/srv/http/matebadges'
set :user, "lucas"
# set :use_sudo, true

server "lfzawacki.com:17200", :app, :web, :db, :primary => true

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:restart", "deploy:cleanup"

after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"

set :normalize_asset_timestamps, false