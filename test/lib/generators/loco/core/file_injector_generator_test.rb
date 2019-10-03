require 'test_helper'
require 'generators/loco/core/file_injector/file_injector_generator'

module Loco
  class Core::FileInjectorGeneratorTest < Rails::Generators::TestCase
    tests Loco::Core::FileInjectorGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    BODY_REPLACEMENT = '<%= content_tag :body, loco_body_data do %>'
    BODY_END_REPLACEMENT = '<% end %>'

    APP_HELPER_ADDON = %(  include Loco::Core::Helpers\n)

    LAYOUT_PATH = Rails.root.join(
                    'app',
                    'views',
                    'layouts',
                    'application.html.erb'
                  )
    APP_HELPER_PATH = Rails.root.join 'app', 'helpers', 'application_helper.rb'

    def setup
      set_initial_layout
      set_initial_helper
      run_generator
    end

    test "updates layout" do
      assert_file LAYOUT_PATH do |content|
        assert_match BODY_REPLACEMENT, content
        assert_match BODY_END_REPLACEMENT, content
      end
    end

    test "updates application helper" do
      assert_file APP_HELPER_PATH do |content|
        assert_match APP_HELPER_ADDON, content
      end
    end

    private

      def set_initial_layout
        update_file(LAYOUT_PATH) do |content|
          content.gsub(BODY_REPLACEMENT, '<body>')
                 .gsub(BODY_END_REPLACEMENT, '</body>')
        end
      end

      def set_initial_helper
        update_file(APP_HELPER_PATH) do |content|
          content.gsub(APP_HELPER_ADDON, '')
        end
      end

      def update_file(path, &modifiers)
        File.read(path)
          .then(&modifiers)
          .then { |content| File.open(path, "w") { |f| f.puts content } }
      end
  end
end