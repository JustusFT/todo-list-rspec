require "rspec"

require_relative "list"
require_relative "task"

describe List do
  let(:task) { Task.new("task") }
  let(:list) { List.new("TODO list", [task, task, task]) }

  # Your specs here
  describe "#initialize" do
    it "should have a title as the first argument" do
      expect(List.new("TODO list")).to be_a_kind_of(List)
    end

    it "should have at least one argument" do
      expect{List.new}.to raise_error(ArgumentError)
    end
  end

  describe "#add_task" do
    it "should add a task" do
      list.add_task(task)
      expect(list.tasks.count).to eq 4
    end

    it "should return false if argument is not a task object" do
      list.add_task("sdfsdfsdf")
      expect(list.tasks.last).to be_a_kind_of(Task)
    end
  end

  describe "#complete_task" do
    it "should complete the task" do
      list.complete_task(0)
      expect(list.tasks[0].complete?).to be(true)
    end

    it "should return false if task does not exist" do
      expect(list.complete_task(100)).to be(false)
    end
  end

  describe "#delete_task" do
    it "should delete a task" do
      expect(list.tasks.count).to eq(3)
      list.delete_task(0)
      expect(list.tasks.count).to eq(2)
    end

    it "should return false if task does not exist" do
      expect(list.delete_task(100)).to be(false)
    end
  end

  describe "#completed_tasks" do
    it "should list the completed tasks" do
      expect(list.completed_tasks.count).to eq(0)
    end
  end

  describe "#incomplete_tasks" do
    it "should list the incomplete tasks" do
      expect(list.incomplete_tasks.count).to eq(3)
    end
  end
end
