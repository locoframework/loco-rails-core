# frozen_string_literal: true

module Loco
  module Core
    module Helpers
      def loco_body_data
        data_controller = controller_name.split('_').map(&:capitalize).join
        {
          'data-namespace' => namespace_name,
          'data-controller' => data_controller,
          'data-action' => action_name
        }
      end

      private

      def namespace_name
        path = controller_path.split('/')
        case path.size
        when 1
          'Main'
        when 2
          path.first
        else
          path[0..-2][-1]
        end.capitalize
      end
    end
  end
end
