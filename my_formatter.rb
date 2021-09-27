class MyFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_failed, :example_group_started, :start
  def initialize(output)
    @output = output
  end

  def start(notification)
    @output << "---\ntitle: 課題評価のフィードバック\n---\n"
  end

  def example_passed(notification)
    @output << "- ✅ #{notification.example.description}\n"
  end

  def example_group_started(notification)
    if notification.group.to_s.count(':') == 4
      @output << "# #{notification.group.description}\n"
    elsif notification.group.to_s.count(':') == 8
      @output << "### #{notification.group.description}\n"
    elsif notification.group.to_s.count(':') == 10
      @output << "###### #{notification.group.description}\n"
    end
  end

  def example_failed(notification)
    @output << "- [ ] ❌ #{notification.example.description}\n"
  end
end
