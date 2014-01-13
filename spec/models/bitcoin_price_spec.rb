require 'spec_helper'

describe BitcoinPrice, 'Validations' do
  it { expect(subject).to validate_presence_of(:avg) }
  it { expect(subject).to validate_presence_of(:buy) }
  it { expect(subject).to validate_presence_of(:high) }
  it { expect(subject).to validate_presence_of(:last) }
  it { expect(subject).to validate_presence_of(:low) }
  it { expect(subject).to validate_presence_of(:server_time) }
  it { expect(subject).to validate_presence_of(:vol) }
  it { expect(subject).to validate_presence_of(:vol_cur) }
end
