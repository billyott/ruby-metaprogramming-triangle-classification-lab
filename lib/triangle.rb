class Triangle
  attr_accessor :side_1, :side_2, :side_3, :kind

  def initialize(side_1,side_2,side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    if side_1 <= 0 || side_2 <= 0 || side_3 <= 0
      begin
        raise TriangleError
      end
    elsif side_1 + side_2 <= side_3 || side_1 + side_3 <= side_2 || side_2 + side_3 <= side_1
      begin
        raise TriangleError
      end
    elsif self.side_1 == self.side_2 && self.side_1 == self.side_3
      self.kind = :equilateral
    elsif self.side_1 == self.side_2 || self.side_1 == self.side_3  
      self.kind = :isosceles
    elsif self.side_2 == self.side_3
      self.kind = :isosceles
    else
      self.kind = :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "That's not a triangle."
    end
  end

end



# class Person
#   attr_accessor :partner, :name

#   def initialize(name)
#     @name = name
#   end

#   def get_married(person)
#     self.partner = person
#     if person.class != Person
#       begin
#         raise PartnerError
#       rescue PartnerError => error
#           puts error.message
#       end
#     else
#       person.partner = self
#     end
#   end

#   class PartnerError < StandardError
#     def message
#       "you must give the get_married method an argument of an instance of the person class!"
#     end
#   end
# end