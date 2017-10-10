require_relative '../task.rb'
describe Task do
  let(:task) {Task.new("Walk the cat.")}

  it "task is not completed" do
    task = Task.new("Walk the cat.")

    expect(task.complete).to eq (false)
    end
  it "task is complete" do
    task = Task.new("Walk the cat.", true)
     expect(task.complete).to eq (true)
    end
  end

