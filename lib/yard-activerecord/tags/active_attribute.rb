
module YARD
  module Tags

    class ActiveAttributeDirective < AttributeDirective

      def create_object
        name = method_name
        scope = parser.state.scope || handler.scope
        visibility = parser.state.visibility || handler.visibility
        ns = CodeObjects::NamespaceObject === object ? object : handler.namespace
        obj = ns.instance_attributes[name]&.fetch(:read, nil) ||
          CodeObjects::MethodObject.new(ns, name, scope)
        obj.scope = scope
        handler.register_file_info(obj)
        handler.register_source(obj)
        handler.register_visibility(obj, visibility)
        handler.register_group(obj)
        unless obj.group == 'Enum Summary' || obj.group == 'Jsonb Summary'
          obj.group = 'Active Record Database Field Summary'
        end
        obj.signature = method_signature
        obj.parameters = OverloadTag.new(:overload, method_signature).parameters
        if obj.docstring[/(Returns the value of the database field #{name.to_s}\.)/]
          replace = $1
          if parser.text.empty?
            if (tag = parser.tags.find { |t| t.tag_name == 'return' })
              text = "Returns #{tag.text}"
              text << '.' unless text[/[\.!\?]$/]
              obj.docstring.sub!(replace, text)
            end
          else
            obj.docstring.sub!(replace, parser.text)
          end
          parser.tags.each { |t| obj.add_tag(t) unless tag_in?(obj.tags, tag) }
          obj.instance_variable_set('@unresolved_reference', parser.reference)
        end
        handler.register_module_function(obj)
        old_obj = parser.object
        parser.object = obj
        parser.post_process
        parser.object = old_obj
        obj
      end

      private

      def tag_in?(tags, tag)
        tags.any? do |t|
          t.tag_name == tag.tag_name && t.text == tag.text &&
          t.types == tag.types
        end
      end
    end

    Library.define_directive :active_attribute, :with_types_and_title, ActiveAttributeDirective
  end
end