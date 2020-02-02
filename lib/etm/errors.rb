module Etm
  # base class exception from which all errors
  class Error < StandardError; end
  # 400: Bad Request
  class BadRequestError < Error; end
  # 400: Invalid Sharing Request
  # 401: Invalid Credentials
  class UnauthorizedError < Error; end
  # 403: Daily Limit Exceeded
  # 403: User Rate Limit Exceeded
  # 403: Rate Limit Exceeded
  # 403: Sharing Rate Limit Exceeded
  class LimitExceedeedError < Error; end
  # 404: Not found Error
  class NotFoundError < Error; end
  # 500: Backend Error
  class UnexpectedError < Error; end
  # Gem Errors
  class NotImplementedError < Error; end
  class FileNotFoundError < Error; end

  ERRORS = {
    400 => Etm::BadRequestError,
    401 => Etm::UnauthorizedError,
    403 => Etm::UnauthorizedError,
    404 => Etm::NotFoundError,
    500 => Etm::UnexpectedError,
    502 => Etm::UnexpectedError,
    503 => Etm::UnexpectedError,
    504 => Etm::UnexpectedError
  }.freeze
end
