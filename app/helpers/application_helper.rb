# frozen_string_literal: true

module ApplicationHelper
  def react_component(name, props = {}, options = {}, &block)
    default_html_options = { data: { react_class: name,
                                     react_props: (props.is_a?(String) ? props : props.to_json) } }
    html_options = options.reverse_merge(default_html_options)
    content_tag(:div, '', html_options, &block)
  end
end
