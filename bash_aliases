#!/bin/bash

# ----------------------------------------------------------------------
# | Navigation                                                         |
# ----------------------------------------------------------------------

alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# ----------------------------------------------------------------------
# | Git                                                                |
# ----------------------------------------------------------------------

alias gba="git branch -a"
alias gcm="git checkout master"
alias glpp="git log --pretty=oneline"
alias gs="git status"
alias gd="git diff"
alias gp="git pull"
alias gci="git commit --interactive"
alias ga="git add"
alias gmt="git mergetool"
alias gpom="git push origin master"
alias gpsm="git push staging master"
alias gppm="git push production master"
alias gr="git rebase -i HEAD~10"
alias gc="git commit -m "
alias gri="git add --all && git commit -m 'WIP' && git rebase -i HEAD~10"

# ----------------------------------------------------------------------
# | Rails                                                              |
# ----------------------------------------------------------------------

alias rc="bin/rails c"
alias rs="bin/rails s"
alias gib="gem install bundler"
alias gibp="gem install bundler --pre"
alias bi="bin/bundle install"
alias bu="bin/bundle update"
alias bx="bin/bundle exec"
alias bs="bin/bundle exec rspec"
alias bir="bin/bundle install --relock"
alias brake="bin/rake"
alias brails="bin/rails"
alias migrate="bin/rake db:migrate"
alias rspec="bin/bundle exec rspec"
alias thin="bin/bundle exec thin"
alias remakedb="bin/rake db:drop db:create db:migrate && bin/rake db:seed"
alias remaketest="bin/rake db:drop db:create db:migrate RAILS_ENV=test"
alias remakedbs="bin/rake db:drop db:create db:migrate && bin/rake db:seed && bin/rake db:drop db:create db:migrate RAILS_ENV=test"

# ----------------------------------------------------------------------
# | Heroku                                                             |
# ----------------------------------------------------------------------

alias prod_logs="heroku logs -t --remote production"
alias stag_logs="heroku logs -t --remote staging"
alias migrate_stag="heroku run rake db:migrate --remote staging"
alias migrate_prod="heroku run rake db:migrate --remote production"
alias reset_stag_db="heroku pg:reset --remote staging DATABASE && heroku run rake db:migrate --remote staging && heroku run rake db:seed --remote staging && heroku restart --remote staging"
alias reset_prod_db="heroku pg:reset --remote production DATABASE && heroku run rake db:migrate --remote production && heroku run rake db:seed --remote production && heroku restart --remote production"

# ----------------------------------------------------------------------
# | Shorter Commands                                                   |
# ----------------------------------------------------------------------

alias :q="exit"
alias c="clear"
alias g="git"
alias ll="ls -l"
alias map="xargs -n1"
alias q="exit"
alias rm="rm -rf"
alias open="start"

# ----------------------------------------------------------------------
# | Docker Commands                                                    |
# ----------------------------------------------------------------------

alias dc="docker-compose"
alias dcr="docker-compose run"
alias dce="docker exec -it"
alias rspec="docker-compose exec web bundle exec rspec"
alias rubocop="docker-compose exec web bundle exec rubocop"
