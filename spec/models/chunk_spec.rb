require 'spec_helper'

describe Chunk do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @chunk = user.chunks.build(description: "Lorem ipsum", status_id: 1)
  end

  subject { @chunk }

  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:status_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @chunk.user_id = nil }
    it { should_not be_valid }
  end

  describe "when status_id is not present" do
    before { @chunk.status_id = nil }
    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @chunk.description = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @chunk.description = "a" * 257 }
    it { should_not be_valid }
  end
end