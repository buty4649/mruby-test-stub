class Object
  def stub(name, val_or_callable, &block)
    temporary_name = "__stub__#{name}"
    metaclass = class << self; self; end

    metaclass.__send__(:alias_method, temporary_name, name)
    metaclass.__send__(:define_method, name) do |*args, **kwargs, &block|
      if val_or_callable.respond_to?(:call)
        val_or_callable.call(*args, **kwargs, &block)
      else
        val_or_callable
      end
    end

    yield

  ensure
    metaclass.__send__(:undef_method, name)
    metaclass.__send__(:alias_method, name, temporary_name)
    metaclass.__send__(:undef_method, temporary_name)
  end
end
