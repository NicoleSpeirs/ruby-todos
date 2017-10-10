require 'csv'
require_relative 'task'

class  TodoList

attr_accessor :tasks

  def initialize(filename)
    @filename = filename
    @tasks = []
    parse_csv(filename)
  end

  def parse_csv(filename)
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row_data|
      @tasks << Task.new(row_data)
    end
  end

  def display_list
    @tasks.each.with_index { |task, index| puts "#{(index +1)} #{task}".to_s}

  end

  def add_item(text)
    @tasks << Task.new(text)
  end

  def toggle_task(task_num)
    task_num = task_num - 1
    task = @tasks[task_num]
    task.toggle
  end


  def remove_item(index)
    @tasks.delete_at(index -1)
  end

  def updated_list
     CSV.open('todo_list_data.csv', 'w') do |csv|
      csv << ["text", "complete"]
      @tasks.each do |task|
        csv << "#{task.text}, #{task.complete}"
      end
    end
  end
end


list = TodoList.new('todo_list_data.csv')
list.add_item("Wash dishes")
list.toggle_task(1)
# list.display_list
list.remove_item(1)
list.display_list
list.updated_list
