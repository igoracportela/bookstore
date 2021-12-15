require "rails_helper"

RSpec.describe Book do

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_numericality_of(:stock) }
  end
end
