# frozen_string_literal: true

module Sync
  class PrintfulBase
    include ActiveModel::Model

    def self.perform(*args)
      new(*args).perform
    end
  end
end
