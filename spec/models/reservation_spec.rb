require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'validations' do
    subject { create(:reservation) }

    it 'is has no_empty data' do
      expect(subject.start_date).to eq('2016-10-10')
      expect(subject.end_date).to eq('2016-10-15')
    end
  end
end
