youtube video tutorial with DailyDrip


https://www.youtube.com/watch?v=bfPb1zD91Rg&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1


this tutorial is good for first 3 videos.

for the rest of the tutorial videos,
https://github.com/knewter/sidekiq_rails_demo
It used Ruby 2.3.0, Rails 4.2.4
neither could bundle installed in ubuntu 16.04 nor ubuntu 18.04

-----------------------------------------------------------
redis server must installed first before sidekiq gem

sidekiq server will repeat itself after restarting unless you have deleted the error codes.

bundle exec sidekiq -r ./worker.rb
# to start sidekiq server

rackup
# to start the management dashboard at localhost:9292 in a browser.

bundle exec irb -r ./worker.rb
# to start irb for this sidekiq worker in a different terminal.

----------------------------------------------------------------------

Api

bundle exec irb -r ./worker.rb
# to start irb for this sidekiq worker in a different terminal.

irb(main):003:0> require 'sidekiq/api'
=> true

irb(main):020:0> stats = Sidekiq::Stats.new
=> #<Sidekiq::Stats:0x000055cd45415448 @stats={:processed=>27, :failed=>16, :scheduled_size=>0, :retry_size=>0, :dead_size=>1, :processes_size=>1, :default_queue_latency=>0, :workers_size=>1, :enqueued=>0}>

irb(main):021:0> s = Sidekiq::Stats::History.new(2)
=> #<Sidekiq::Stats::History:0x000055cd453558c8 @days_previous=2, @start_date=#<Date: 2020-05-30 ((2459000j,0s,0n),+0s,2299161j)>>
irb(main):022:0> s.failed
=> {"2020-05-30"=>6, "2020-05-29"=>10}
irb(main):023:0> s.processed
=> {"2020-05-30"=>11, "2020-05-29"=>16}

irb(main):024:0> s = Sidekiq::Stats::History.new(2, Date.parse("2019-12-3"))
=> #<Sidekiq::Stats::History:0x000055cd454434d8 @days_previous=2, @start_date=#<Date: 2019-12-03 ((2458821j,0s,0n),+0s,2299161j)>>
irb(main):025:0> s.processed
=> {"2019-12-03"=>0, "2019-12-02"=>0}

--------------------------------------------------------------------

Depoly mail app to heroku

1. setup redis

2. setup a worker for sidekiq

3. setup a email server, such as sendgrid


