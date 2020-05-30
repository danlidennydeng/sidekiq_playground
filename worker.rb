require 'sidekiq'

Sidekiq.configure_client do |config|
    config.redis = { db: 2 }
end

Sidekiq.configure_server do |config|
    config.redis = { db: 2 }
end

class OurWorker
    include Sidekiq::Worker
    #sidekiq_options retry: 0

    def perform(complexity)
        case complexity
        when "super_hard"
            sleep 3000
            #puts "charging a credit card"
            #raise "woops stuff got bad."
            puts "That was super hard!"
        when "hard"
            sleep 10
            puts "That was a bit of work"

        else
            # # while true do
            # #     sleep 1
            #     puts "Zomg bug!!!"
            # #end

            puts "That wasn't a lot of effort"
        end
    end
end