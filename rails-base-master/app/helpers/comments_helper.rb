module CommentsHelper
  def calculate_time_ago(created_at_comment)
    time_now = Time.now
    time_now.day - created_at_comment.day
  end
end
