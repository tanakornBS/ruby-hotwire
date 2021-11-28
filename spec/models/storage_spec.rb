require 'rails_helper'

RSpec.describe Storage, :type => :model do
  it "is valid with valid attributes" do
    expect(Storage.new(name:"Banana",qty:"300"))
  end
  it "is not valid without a name"
  it "is not valid without a qty"
end