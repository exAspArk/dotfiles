class Object
  def local_methods(obj = self) # list methods which aren't in superclass
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end
