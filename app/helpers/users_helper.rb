module UsersHelper
  def normalized_score(score)
    score / Dumagst.configuration.score_scale
  end
end
