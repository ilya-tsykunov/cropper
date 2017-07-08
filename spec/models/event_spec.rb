require 'rails_helper'

RSpec.describe Event, type: :model do
  context '#validation' do
    describe '#end_date' do
      describe 'must be greater than Start date' do
        let(:error_message) { 'Must be greater than Start date' }

        it 'should not appear if start_date is blank' do
          event = build(:event, start_date: nil, end_date: DateTime.current)
          event.valid?

          expect(event.errors.messages[:end_date]).not_to include(error_message)
        end

        it 'should not appear if end_date is blank' do
          event = build(:event, start_date: DateTime.current, end_date: nil)
          event.valid?

          expect(event.errors.messages[:end_date]).not_to include(error_message)
        end

        it 'should appear if start_date == end_date' do
          date = DateTime.current
          event = build(:event, start_date: date, end_date: date)
          event.valid?

          expect(event.errors.messages[:end_date]).to include(error_message)
        end

        it 'should appear if start_date > end_date' do
          date = DateTime.current
          event = build(:event, start_date: date, end_date: date - 1.minute)
          event.valid?

          expect(event.errors.messages[:end_date]).to include(error_message)
        end

        it 'should not appear if start_date < end_date' do
          event = build(:event)
          event.valid?

          expect(event.errors.messages[:end_date]).not_to include(error_message)
        end
      end
    end
  end
end
