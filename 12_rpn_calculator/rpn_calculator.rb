class RPNCalculator
    attr_accessor :calculator, :temp
    
    def initialize
        @stack = []
        @result = 0
    end
    
    def push(num)
        @stack.push(num)
    end
    
    def plus
        if @stack.length == 0
            raise "calculator is empty"
        end
        
        if @stack.length == 1
            @temp = @result
            @result = @result + @stack[0]
            @stack.clear
        else
            @temp = @result
            @result = @stack[-1] + @stack[-2]
            @stack.pop(2)
        end
        return @result
    end
    
    def minus
        if @stack.length == 0
            raise "calculator is empty"
        end
        
        if @stack.length == 1
            @temp = @result
            @result = @stack[0] - @result
            @stack.clear
        else
            @temp = @result
            @result = @stack[-2] - @stack[-1]
            @stack.pop(2)
        end
        return @result
    end
    
    def times
        if @stack.length == 0
            raise "calculator is empty"
        end
        
        if @stack.length == 1
            @result = @stack[0] * @result
            @stack.clear
        else
            @result = @stack[-2] * @stack[-1]
            @stack.pop(2)
        end
        return @result
    end
    
    def divide
        if @stack.length == 0 && !@temp.nil?
            @result = @temp / @result
        elsif @stack.length == 0 && @temp.nil?
            raise "calculator is empty"
        elsif @stack.length == 1 && @stack[0].is_a?(Float)
            puts "WOAHHHHH!"
            @result = Float(@stack[0]) / Float(@result)
            @stack.clear
        else
            puts "HOOOO!"
            @result = Float(@stack[-2]) / Float(@stack[-1])
            @stack.pop(2)
        end
        return @result
    end
    
    def value
        return @result
    end
    
    def tokens(s)
        s.split.map do |t|
            case t
                when '+', '-', '*', '/'
                    t.to_sym
                else 
                    t.to_f
            end
        end
    end
    
    def evaluate(s)
        initialize
        tokens(s).each do |t|
            case t
                when :+
                    puts "plus"
                    plus
                when :-
                    puts "minus"
                    puts @stack[0]
                    puts @stack.length
                    minus
                when :*
                    puts "times"
                    times
                when :/
                    puts "divide"
                    puts @stack[0]
                    puts @stack.length
                    divide
                else
                    push(Float(t))
            end
            puts @result
            puts @temp
        end
        return value
    end
end