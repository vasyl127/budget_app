# frozen_string_literal: true

module ExchangeRate
  class Base
    def return_last
      day_ago = Time.now - 1.day
      record = Currency.find_by('created_at > ?', day_ago)
      return record if record.present?

      crate_new_exchange_rate
    end

    def crate_new_exchange_rate
      Currency.create(::ExchangeRate::Parse.new.call)
    end
  end
end
