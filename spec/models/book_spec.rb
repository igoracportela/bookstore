require "rails_helper"

RSpec.describe Book do

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
    it { is_expected.to validate_numericality_of(:stock) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:stock).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:slug).of_type(:string) }
    it { is_expected.to have_db_column(:cover_image_url).of_type(:string) }
    it { is_expected.to have_db_column(:average_score).of_type(:integer) }
  end
end
