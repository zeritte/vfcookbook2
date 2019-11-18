class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :created_by_id, :before_en, :before_de, :after_en, :after_de, :footnote_en, :footnote_de

  def name
    object.try(:name)
  end

  def created_at
    object.created_at.strftime('%B %-d, %Y')
  end
end
