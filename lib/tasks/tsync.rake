desc "This task is called to sync the curates with sources"
  task :tsync => :environment do
    SyncData.follow
    SyncData.process
  end

