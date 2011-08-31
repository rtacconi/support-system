require 'spec_helper'

describe Status do
  it "should load pre-defined statues" do
    Status.init_statuses
    Status.count.should > 0
  end
end
