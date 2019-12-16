class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :created_by, :created_by_id, :before_en, :before_de, :after_en, :after_de, :footnote_en, :footnote_de, :is_approved

  def name
    object.try(:name)
  end

  def created_by
    User.find(object.created_by_id).try(:name)
  end

  def created_at
    object.created_at.strftime('%B %-d, %Y')
  end
end
