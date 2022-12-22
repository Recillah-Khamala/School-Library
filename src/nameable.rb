# Create a class Nameable.
class Nameable
  # Implement a method called correct_name that will raise a NotImplementedError.
  def correct_name
    raise NotImplementedError "#{self.class}
     has not implemented method '#{_method_}'"
  end
end
