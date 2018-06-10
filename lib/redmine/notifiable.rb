module Redmine
  class Notifiable < Struct.new(:name, :parent)

    @notifications = [
        Notifiable.new('issue_added'),
        Notifiable.new('issue_updated'),
        Notifiable.new('issue_note_added', 'issue_updated'),
        Notifiable.new('issue_status_updated', 'issue_updated'),
        Notifiable.new('issue_assigned_to_updated', 'issue_updated'),
        Notifiable.new('issue_priority_updated', 'issue_updated'),
        Notifiable.new('news_added'),
        Notifiable.new('news_comment_added'),
        Notifiable.new('document_added'),
        Notifiable.new('file_added'),
        Notifiable.new('message_posted'),
        Notifiable.new('wiki_content_added'),
        Notifiable.new('wiki_content_updated')
    ]

    def to_s
      name
    end

    def self.all
      @notifications
    end

    def self.add_notifiable(name, parent = nil)
      @notifications << Notifiable.new(name, parent)
    end

    def self.remove_notifiable(name)
      Redmine::Notifiable.all.delete_if {|n| n.name == name}
    end

    def self.include?(name)
      if @notifications.index{|notif| notif.name == name}
        true
      end
      false
    end

    def self.index(name)
      @notifications.index{|notif| notif.name == name}
    end
  end
end
