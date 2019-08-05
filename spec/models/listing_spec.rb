require 'rails_helper'

RSpec.describe Listing, type: :model do
  context 'validations' do
    subject { create(:listing) }

    it 'is has no_empty data' do
      expect(subject.num_rooms).to eq('3')
    end
  end
end
