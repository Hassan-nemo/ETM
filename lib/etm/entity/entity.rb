# frozen_string_literal: true

module Etm
  module Entity
    include Dry.Types()

    ISO8601_UTC = /^(-?(?:[1-9][0-9]*)?[0-9]{4})-(1[0-2]|0[1-9])-(3[01]|0[1-9]|[12][0-9])T(2[0-3]|[01][0-9]):([0-5][0-9]):([0-5][0-9])(\\.[0-9]+)?(Z)?$/i.freeze
    TIMEZONE = /[+-±][0-9]{2}:[0-9]{2}\b/i.freeze
    CODES = %w[alpha beta gamma delta theta lambda tau psi omega].freeze

    ISO8601_TYPE = ::Dry::Types['string'].constrained(format: ISO8601_UTC)

    TIMEZONE_TYPE = ::Dry::Types['string'].constrained(format: TIMEZONE)

    AlphanumericCode = ::Dry::Types['string'].enum(*CODES)

  end
end
