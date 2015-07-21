class SyncData

  def self.follow
    @experts = Expert.where(is_active: 0).limit(10)

    t = TwitterSync.new
    t.Follow(@experts)
  end

  def self.process
    @experts = Expert.all

    t = TwitterSync.new
    t.Sync(@experts)
  end

end