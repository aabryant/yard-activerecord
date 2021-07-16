module YARD::Handlers::Ruby::ActiveRecord::Fields
  class JsonbHandler < YARD::Handlers::Ruby::AttributeHandler
    include YARD::Templates::Helpers::HtmlHelper 

    handles method_call(:jsonb_accessor)
    namespace_only

    attr_reader :options

    def initialize(*args)
      super
      @options = YARD::Options.new.update(markup: :ruby)
    end

    def process
      jsonb_name = call_params.first
      method_definition = namespace.instance_attributes[jsonb_name.to_sym] || {}
      { read: jsonb_name, write: "#{jsonb_name}=" }.each do |(rw, name)|
        jsonb = method_definition[rw]
        unless jsonb
          jsonb = register YARD::CodeObjects::MethodObject.new(namespace, name)
          method_definition[rw] = jsonb
        end
        if jsonb.docstring.empty?
          jsonb.docstring = "Returns the value of the database field #{jsonb_name}."
        end
        jsonb.group = 'Jsonb Summary'
        jsonb.docstring << "\n<br>\n<br>\n<b>Jsonb Values:</b>\n<br>\n#{shift_left(statement.source)}"
      end
      namespace.instance_attributes[jsonb_name.to_sym] ||= method_definition
    end

    private

    def shift_left(string)
      lines = string.split(/[\r\n]+/)
      shift_distance = lines.last[/^(\s+)/, 1].size
      lines.each_with_index do |line, idx|
        i = 0
        i += 1 while line[i] == ' ' && i < shift_distance
        lines[idx] = "  #{line[i..-1]}"
      end
      lines.join("\n")
    end
  end
end
