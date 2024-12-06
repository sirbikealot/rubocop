# frozen_string_literal: true

module RuboCop
  module Cop
    module Lint
      # Checks for the use of the .subclasses method.
      #
      # @example
      #
      #   # bad
      #   MyModel.subclasses
      #
      #   # good
      #   MyModel.<method_to_register_all_child_classes>
      #
      class SubclassesMethod < Base
        MSG = '`.subclasses` is deprecated in favor of explicitly registering classes.'

        RESTRICT_ON_SEND = %i[subclasses].freeze

        def on_send(node)
          return unless node.method? :subclasses

          add_offense(node)
        end
        alias on_csend on_send
      end
    end
  end
end
