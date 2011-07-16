require 'spec_helper'

describe Email do
  it { should validate_presence_of(:email) }
end
