module YARD::Handlers::Ruby::ActiveRecord::Fields
  class EnumHandler < YARD::Handlers::Ruby::AttributeHandler
    include YARD::Templates::Helpers::HtmlHelper 

    handles method_call(:enum)
    namespace_only

    attr_reader :options

    def initialize(*args)
      super
      @options = YARD::Options.new.update(markup: :ruby)
    end

    def process
      enum_name = statement.parameters.jump(:label).first
      method_definition = namespace.instance_attributes[enum_name.to_sym] || {}
      { read: enum_name, write: "#{enum_name}=" }.each do |(rw, name)|
        enum = method_definition[rw]
        unless enum
          enum = register YARD::CodeObjects::MethodObject.new(namespace, name)
          method_definition[rw] = enum
        end
        if enum.docstring.empty?
          enum.docstring << "Returns the value of the database field #{enum_name}."
        end
        enum.group = 'Enum Summary'
        enum.docstring << "\n<br>\n<br>\n<b>Enum Values:</b>\n<br>\n<pre class='code ruby'><code class='ruby'>#{statement.source}</code></pre>"
      end
      namespace.instance_attributes[enum_name.to_sym] ||= method_definition
    end
  end
end
