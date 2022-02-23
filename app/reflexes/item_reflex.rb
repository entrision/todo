# frozen_string_literal: true

class ItemReflex < ApplicationReflex
  def done
    @item = Item.find element.attributes['data-item-id']
    @item.completed_at = DateTime.now
    @item.done = true
    @item.save!
    @item.reload
    html = render partial: 'items/item', object: @item
    morph("#{dom_id(@item)}", html)
  end

  def delete
    @item = Item.find element.attributes['data-item-id']
    @item.destroy
  end
end
