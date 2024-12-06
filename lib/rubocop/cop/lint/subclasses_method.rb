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

        # @!method deprecate_subclasses_method?(node)
        def_node_matcher :deprecate_subclasses_method?, <<~PATTERN
          (send nil? :subclasses)
        PATTERN

        # By default, this is aliased to `on_csend` as well to handle method calls
        # with safe navigation, remove the alias if this is unnecessary.
        # If kept, ensure your tests cover safe navigation as well!
        def on_send(node)
          return unless node.method? :subclasses

          add_offense(node)
        end
        alias on_csend on_send
      end
    end
  end
end
