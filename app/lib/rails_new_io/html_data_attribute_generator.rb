module RailsNewIo
  class HtmlDataAttributeGenerator
    def initialize(item_name, menu_card_in_all_states, menu_card_id)
      @item_name = item_name
      @menu_card_in_all_states = menu_card_in_all_states
      @menu_card_id = menu_card_id
    end

    def html_data_attributes
      @menu_card_in_all_states[@item_name].each_with_object([]) { |(base_state_name, base_state_display_state), html_data_attributes|
        html_data_attributes << html_data_attribute(base_state_name, base_state_display_state[:checked])
      }.join(" ").html_safe
    end

    private

    def html_data_attribute(base_state_name, base_state_value)
      attribute_code = <<-CODE
        #{attribute_name(base_state_name)}="#{base_state_value}"
      CODE

      attribute_code.squish.tr(" ", "")
    end

    def attribute_name(base_state_name)
      "data-#{base_state_name}".downcase.dasherize
    end
  end
end
