module RailsNewIo
  class RailsBytesComboGenerator
    def initialize(single_rails_bytes)
      @single_rails_bytes = single_rails_bytes
    end

    def generate
      tagged_menu_card_items_for_all_menu_cards = @single_rails_bytes.each_with_object([]) { |(menu_card, menu_card_items), result_outer|
        tagged_menu_card_items = menu_card_items.each_with_object([]) { |(menu_card_item, rails_bytes_url), result_inner|
          result_inner << "#{menu_card}-#{menu_card_item}"
        }

        result_outer << tagged_menu_card_items
      }

      combos = produce_combos(tagged_menu_card_items_for_all_menu_cards[0], tagged_menu_card_items_for_all_menu_cards[1..])
      combos.map(&:flatten).map(&:sort).map { |x| x.join("@") }.sort
    end

    private

    def produce_combos(head, tail)
      tail.size == 1 ? head.product(tail.pop) : produce_combos(head.product(tail[0]), tail[1..])
    end
  end
end
