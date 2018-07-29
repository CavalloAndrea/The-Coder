require 'rails_helper'

RSpec.describe Problem, :type => :model do
  subject { described_class.new(
      titolo: "Prova",
      linguaggio: "C",
      esercizio: "bla",
      soluzione: "procedura"
      ) }
    
     it "is not valid without a title" do
        subject.titolo = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a problem text" do
        subject.esercizio = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a title" do
        subject.soluzione = nil
        expect(subject).to_not be_valid
    end
end
