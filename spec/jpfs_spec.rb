RSpec.describe Jpfs do
  it "has a version number" do
    expect(Jpfs::VERSION).not_to be nil
  end

  describe '.search' do
    subject { described_class.search(**point) }

    context 'Tokyo Skytree' do
      let(:point) { { longitude: 139.8108103, latitude: 35.7100069 } }

      it 'returns Tokyo' do
        expect(subject.japanese).to eq('東京都')
      end
    end

    context 'Joumonsugi' do
      let(:point) { { longitude: 130.5317994, latitude: 30.3607272 } }

      it 'returns Kagoshima' do
        expect(subject.japanese).to eq('鹿児島県')
      end
    end

    context 'the Statue of Liberty' do
      let(:point) { { longitude: 40.6892, latitude: -74.0445 } }

      it 'returns nil' do
        is_expected.to be_nil
      end
    end
  end
end
