require "./helper"

module Tempest
  describe Tempest::Listen do
    it "should initialize listen requests" do
      listen = Tempest::Listen.new("listen_start", rand(10_000).to_s, 100_i64)
      listen.type.should eq("listen_start")
    end
  end
end
