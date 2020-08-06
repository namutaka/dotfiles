#
# Define handy methods for debug in irb.
#
module Handy
  # Call Kernel#p method with self.
  def pp
    p self
    self
  end

  # Call Kernel#puts method with self.
  def pt
    puts self
    self
  end

  # Stans for 'puts methods'.
  #
  # Show instance methods with detail.
  def pm(pattern = nil)
    klass = self.is_a?(Class) ? self : self.class
    ancs = klass.ancestors
    mtds = self.methods
    mtds = mtds.grep(pattern) if pattern
    mtds.sort.each do |e|
      ent = ancs.find {|c| c.instance_methods(false).include?(e) }
      ent ||= "self"
      puts "#{e} in #{ent}"
    end
  end

  # Stans for 'puts ancestors'.
  #
  # Show ancestors for self class. Included modules show with prefix '-'.
  def pa
    klass = self.is_a?(Class) ? self : self.class
    inc_mods = klass.included_modules
    klass.ancestors.each do |c|
      puts inc_mods.include?(c) ? "-#{c}" : "#{c}"
    end
  end

  # Stans for 'puts hierarchy'.
  #
  # Show classes extended or included self class.
  def ph
    klass = self.is_a?(Class) ? self : self.class
    ObjectSpace.each_object(Class).select {|c| c < klass }.pt
  end

  # Stans for 'puts class variables'.
  #
  # Show class variables name with value.
  def pcv
    klass = self.is_a?(Class) ? self : self.class
    klass.class_variables.each do |vn|
      puts "#{vn} = #{klass.class_eval(vn).inspect}"
    end
  end

  # Stans for 'puts instance variables'.
  #
  # Show instance variables name with value.
  def piv
    self.instance_variables.each do |vn|
      puts "#{vn} = #{self.instance_eval(vn).inspect}"
    end
  end
end

Object.send(:include, Handy)

