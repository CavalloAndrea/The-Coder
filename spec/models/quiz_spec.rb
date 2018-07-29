require 'rails_helper'

RSpec.describe Quiz, :type => :model do
  subject { described_class.new(
      titolo: "Prova",
      d1: "Dom1",
      d2: "Dom2",
      d3: "Dom3",
      d4: "Dom4",
      d5: "Dom5",
      g1: "giusta1",
      g2: "giusta2",
      g3: "giusta3",
      g4: "giusta4",
      g5: "giusta5",
      r1_1:"R1",
      r1_2:"giusta1",
      r1_3:"R3",
      r2_1:"R1",
      r2_2:"giusta2",
      r2_3:"R3",
      r3_1:"R1",
      r3_2:"giusta3",
      r3_3:"R3",
      r4_1:"R1",
      r4_2:"giusta4",
      r4_3:"R3",
      r5_1:"R1",
      r5_2:"giusta5",
      r5_3:"R3",
      tutorial_id: "1",
      next: "2"
      ) }
    
    it "is not valid without a title" do
        subject.titolo = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a d1" do
        subject.d1 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a d2" do
        subject.d2 = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a d3" do
        subject.d3 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a d4" do
        subject.d4 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a d5" do
        subject.d5 = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a g1" do
        subject.g1 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a g2" do
        subject.g2 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a g3" do
        subject.g3 = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a g4" do
        subject.g4 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a g5" do
        subject.g5 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a r1_1" do
        subject.r1_1 = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a r1_2" do
        subject.r1_2 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a r1_3" do
        subject.r1_3 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a r2_1" do
        subject.r2_1 = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a r2_2" do
        subject.r2_2 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a r2_3" do
        subject.r2_3 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a r3_1" do
        subject.r3_1 = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a r3_2" do
        subject.r3_2 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a r3_3" do
        subject.r3_3 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a r4_1" do
        subject.r4_1 = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a r4_2" do
        subject.r4_2 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a r4_3" do
        subject.r4_3 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a r5_1" do
        subject.r5_1 = nil
        expect(subject).to_not be_valid
    end
    it "is not valid without a r5_2" do
        subject.r5_2 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a r5_3" do
        subject.r5_3 = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a tutorial_id" do
        subject.tutorial_id = nil
        expect(subject).to_not be_valid
    end

     it "is not valid without a next" do
        subject.next = nil
        expect(subject).to_not be_valid
    end
end