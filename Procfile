web: bundle exec puma
worker: bundle exec sidekiq -t 25 -q default -q mailers -c 3
