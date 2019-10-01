# frozen_string_literal: true

module Loco
  module Core
    class FileInjectorGenerator < Rails::Generators::Base
      def application_helper
        file_path = Rails.root.join 'app', 'helpers', 'application_helper.rb'
        line = %(  include Loco::Core::Helpers\n)
        inject_into_file file_path, line, after: "module ApplicationHelper\n"
      end

      def layout
        gsub_file(
          layout_path,
          '<body>',
          '<%= content_tag :body, loco_body_data do %>'
        )
        gsub_file layout_path, '</body>', '<% end %>'
      end

      def layout_path
        Rails.root.join(
          'app',
          'views',
          'layouts',
          'application.html.erb'
        )
      end
    end
  end
end
