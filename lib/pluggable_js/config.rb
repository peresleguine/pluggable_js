module PluggableJs
  module Config
    DEFAULT_PAIR_ACTIONS = { 'create' => 'new', 'update' => 'edit' }

    class << self
      def pair_actions=(hash = {})
        @pair_actions = DEFAULT_PAIR_ACTIONS.merge hash
      end

      def pair_actions
        @pair_actions ||= DEFAULT_PAIR_ACTIONS
      end
    end

  end
end