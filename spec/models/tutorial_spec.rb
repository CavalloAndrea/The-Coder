require 'rails_helper'

RSpec.describe Tutorial, :type => :model do
  subject { described_class.new(
      titolo: "Prova",
      lezione: "Questa è una lezione",
      linguaggio: "C"
      ) }

  it "is not valid without a title" do
        subject.titolo = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a lesson text" do
        subject.lezione = nil
        expect(subject).to_not be_valid
    end

    it "is not valid without a language" do
        subject.linguaggio = nil
        expect(subject).to_not be_valid
    end
    
end
