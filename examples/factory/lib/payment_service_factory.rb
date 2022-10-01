class PaymentServiceFactory
  def self.for(entity)
    if entity.is_a?(User)
      Services::UserPaymentService.new
    elsif entity.is_a?(Manager)
      Services::ManagerPaymentService.new
    end
  end
end
