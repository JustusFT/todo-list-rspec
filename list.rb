class List
  attr_reader :title
  attr_accessor :tasks

  def initialize(title, tasks = [])
    @title = title
    @tasks = tasks
  end

  def add_task(task)
    return false if task.class != Task
    tasks << task
  end

  def complete_task(index)
    return false unless tasks[index]
    tasks[index].complete!
  end

  def delete_task(index)
    return false unless tasks[index]
    tasks.delete_at(index)
  end

  def completed_tasks
    tasks.select { |task| task.complete? }
  end

  def incomplete_tasks
    tasks.select { |task| !task.complete? }
  end
end
