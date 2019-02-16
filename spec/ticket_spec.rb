require 'ticket'

describe Ticket do
  describe '#update' do
    context 'before sell_in date becomes negative' do
      it 'increases the quality of the item by one if there are more than 10 days left' do
        ticket = Ticket.new('Ticket', 12, 5)
        ticket.update
        expect(ticket.sell_in).to eq 11
        expect(ticket.quality).to eq 6
      end
      it 'increases the quality of the item by two if there are 5 to 10 days left' do
        ticket = Ticket.new('Ticket', 7, 5)
        ticket.update
        expect(ticket.sell_in).to eq 6
        expect(ticket.quality).to eq 7
      end
      it 'increases the quality of the item by three if there are less than 5 days left' do
        ticket = Ticket.new('Ticket', 4, 5)
        ticket.update
        expect(ticket.sell_in).to eq 3
        expect(ticket.quality).to eq 8
      end
    end

    context 'once sell_in date is negative' do
      it 'drops the quality to 0' do
        ticket = Ticket.new('Ticket', 0, 5)
        ticket.update
        expect(ticket.sell_in).to eq(-1)
        expect(ticket.quality).to eq 0
      end
    end
  end

  describe '#quality' do
    it 'is never becomes negative' do
      ticket = Ticket.new('Ticket', -1, 0)
      ticket.update
      expect(ticket.sell_in).to eq(-2)
      expect(ticket.quality).to eq 0
    end
    it 'is never higher than 50' do
      ticket = Ticket.new('Ticket', 3, 49)
      ticket.update
      expect(ticket.sell_in).to eq 2
      expect(ticket.quality).to eq 50
    end
  end
end
