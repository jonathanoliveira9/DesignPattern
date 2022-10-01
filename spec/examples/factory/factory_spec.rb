require './examples/factory/lib/payment_service_factory'
require './examples/factory/lib/user'
require './examples/factory/lib/manager'
require './examples/factory/lib/exceptions/forbidden_access'
require './examples/factory/lib/services/manager_payment_service'
require './examples/factory/lib/services/user_payment_service'

describe PaymentServiceFactory do
  let(:user) { User.new 'John Doe' }
  let(:manager) { Manager.new 'The Boss' }

  it 'allows a manager to perform payments' do
    service = described_class.for manager
    service.pay user, 500
  end

  it 'forbids a regular user to perform payments' do
    service = described_class.for user
    expect { service.pay manager, 500 }.to raise_error(ForbiddenAccessError)
  end
end
