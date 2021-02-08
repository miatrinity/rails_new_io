module ManualAppVerifications
  class Component < ViewComponent::Base
    def initialize(rails_bytes:)
      @rails_bytes = rails_bytes
    end

    def table_row_for(rails_byte)
      "#{menu_card_name_cell(rails_byte)} #{rails_byte_name_cell(rails_byte)}".html_safe
    end

    def rails_byte_setup_component_for(rails_byte)
      "ManualAppVerifications::SetupSteps::#{componentize(rails_byte)}::Component".constantize
    end

    def rails_byte_verification_component_for(rails_byte)
      "ManualAppVerifications::VerificationSteps::#{componentize(rails_byte)}::Component".constantize
    end

    def rails_byte_teardown_component_for(rails_byte)
      "ManualAppVerifications::TeardownSteps::#{componentize(rails_byte)}::Component".constantize
    end

    private

    def componentize(rails_byte)
      menu_card_name, *rails_byte_name = rails_byte.split("-")

      [menu_card_name.capitalize, rails_byte_name.map(&:capitalize).join("")].join("::")
    end

    def bold_or_extralight(rails_byte_name)
      rails_byte_name.downcase.in?(%w[none minitest]) ? "font-extralight" : "font-semibold"
    end

    def menu_card_name_cell(rails_byte)
      menu_card_name, rails_byte_name = rails_byte.split("-")

      content_tag :div, class: bold_or_extralight(rails_byte_name) do
        "#{menu_card_name.capitalize}:"
      end
    end

    def rails_byte_name_cell(rails_byte)
      _, *rails_byte_name_pieces = rails_byte.split("-")

      rails_byte_name = rails_byte_name_pieces.map(&:capitalize).join(" ")

      content_tag :div, class: bold_or_extralight(rails_byte_name) do
        rails_byte_name
      end
    end
  end
end
