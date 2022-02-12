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
        path = controller_path.split '/'
        if path.size > 1
          path.first
        else
          'Main'
        end.capitalize
      end
    end
  end
end
