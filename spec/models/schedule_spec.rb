RSpec.describe Schedule, type: :model do
  describe "Save schedule" do
    it "is valid with valid attributes" do
      expect(build(:schedule)).to be_valid
    end

    it "is invalid without requiered attributes" do
      expect(build(:invalid_schedule)).to_not be_valid
    end
  end

  describe "Validations" do
    it { should validate_presence_of(:starts_at) }
    it { should validate_presence_of(:ends_at) }
  end

  describe "Associations" do
    it { should have_many(:days) }
  end
end
