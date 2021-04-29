require 'rails_helper'

RSpec.describe BuyerStock, type: :model do
  describe 'check_db' do
    context 'when stock has not yet been bought by buyer' do
      let!(:buyer) { FactoryBot.create(:buyer) }
      let!(:stock) { FactoryBot.create(:stock) }

      it "returns 'nil'" do
        expect(described_class.check_db(stock.id, buyer.id)).to be_nil
      end
    end

    context 'when stock has already been bought by buyer' do
      let!(:buyer) { FactoryBot.create(:buyer) }
      let!(:stock) { FactoryBot.create(:stock) }

      it 'returns the stock object' do
        buyer.stocks << stock
        expect(described_class.check_db(stock.id, buyer.id)).to be_a_kind_of Object
      end
    end
  end

  describe 'check_info' do
    context 'when requesting for valid company information from IEX Gem' do
      it 'returns company information object' do
        expect(described_class.check_info('GOOG')).to be_a_kind_of Object
      end
    end

    context 'when requesting for invalid company information from IEX Gem' do
      it 'returns nil' do
        expect(described_class.check_info('asdfjkl')).to be_nil
      end
    end
  end
end
