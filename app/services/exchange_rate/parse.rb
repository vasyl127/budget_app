# frozen_string_literal: true

require 'net/http'
require 'json'

module ExchangeRate
  class Parse
    CASH_URL = 'https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5'
    BANK_URL = 'https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11'

    def call
      { usd: { 'bank' => bank_currency['USD'], 'cash' => cash_currency['USD'] },
        eur: { 'bank' => bank_currency['EUR'], 'cash' => cash_currency['EUR'] } }
    end

    def cash_currency
      hash = {}
      url_to_hash(CASH_URL).each do |json_cash|
        hash[json_cash['ccy']] = { buy: json_cash['buy'].to_f.round(2),
                                   sale: json_cash['sale'].to_f.round(2) }
      end

      @cash_currency ||= hash
    end

    def bank_currency
      hash = {}
      url_to_hash(BANK_URL).each do |json_bank|
        hash[json_bank['ccy']] = { buy: json_bank['buy'].to_f.round(2),
                                   sale: json_bank['sale'].to_f.round(2) }
      end

      @bank_currency ||= hash
    end

    def url_to_hash(url)
      JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)
    end
  end
end
