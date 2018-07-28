require 'rails_helper'

RSpec.describe Problem, :type => :model do
  subject { described_class.new(
      titolo: "Prova",
      linguaggio: "C",
      esercizio: "bla",
      soluzione: "procedura"
      ) }
    
end
