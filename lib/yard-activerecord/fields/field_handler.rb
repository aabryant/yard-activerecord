module YARD::Handlers::Ruby::ActiveRecord::Fields
  class FieldHandler < YARD::Handlers::Ruby::MethodHandler
    in_file 'schema.rb'

    handles method_call(:string)
    handles method_call(:text)
    handles method_call(:integer)
    handles method_call(:float)
    handles method_call(:boolean)
    handles method_call(:decimal)
    handles method_call(:timestamp)
    handles method_call(:datetime)
    handles method_call(:date)
    handles method_call(:bigint)
    handles method_call(:jsonb)
    handles method_call(:geometry)
    handles method_call(:st_point)
    handles method_call(:point)
    handles method_call(:geography)
    handles method_call(:decimal)

    def process
      return unless statement.namespace.jump(:ident).source == 't'
      method_name = call_params.first

      ensure_loaded! P(globals.klass)
      namespace = P(globals.klass)
      return if namespace.nil?

      method_definition = namespace.instance_attributes[method_name.to_sym] || {}

      { read: method_name, write: "#{method_name}=" }.each do |(rw, name)|
        method = method_definition[rw]
        if method
          method.docstring.add_tag(get_tag(:return, '', class_name)) unless method.has_tag?(:return)
          next
        end
        rw_object = register YARD::CodeObjects::MethodObject.new(namespace, name)
        rw_object.docstring = "Returns the value of the database field #{method_name}."
        rw_object.docstring.add_tag get_tag(:return, '', class_name)
        rw_object.group = 'Active Record Database Field Summary'
        rw_object.dynamic = true
        method_definition[rw] = rw_object
      end

      namespace.instance_attributes[method_name.to_sym] = method_definition
    end

    def get_tag(tag, text, return_classes)
      YARD::Tags::Tag.new(:return, text, [return_classes].flatten)
    end

    private

    def class_name
      case caller_method
      when 'datetime', 'timestamp'
        'DateTime'
      when 'geography', 'st_point'
        'Point'
      when 'jsonb'
        'Hash'
      else
        caller_method.capitalize
      end
    end
  end
end
