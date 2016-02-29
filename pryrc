if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'e', 'edit'
end

class Object
  def local_methods(obj = self) # list methods which aren't in superclass
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end
