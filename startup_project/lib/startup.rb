require "employee"

class Startup
    # ("Mystry Machinr", 52000, "CEO"=>4800, "Pilot"=>2500, "Kungfu Master"=>2300)
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = {}
        salaries.each do |title, salary|
            @salaries[title] = salary
        end
        @employees = []
    end

    ###### getters
    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end
    ###### end of getters

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(employee, title)
        if self.valid_title?(title)
            employees.push( Employee.new(employee, title) )
        else
            raise "Error! No title found"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        to_pay = @salaries[employee.title]
        if @funding > to_pay
            employee.pay(to_pay)
            @funding -= to_pay
        else
            raise "Sorry, funding's not enough to pay their bills..."
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        employees.each do |employee|
            sum += @salaries[employee.title]
        end

        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding

        # merging salaries, without overwrite
        other_startup.salaries.each do |title, amount|
            if !@salaries.has_key?(title)
                @salaries[title] = amount
            end
        end

        # merging employees
        other_startup.employees.each do |employee|
            @employees.push(employee)
        end

        other_startup.close
    end


end