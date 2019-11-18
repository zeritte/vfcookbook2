class VfCaseSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :domain, :impact, :case_class, :type, :documentation, :case_id, :is_active, :content_en, :content_de
  has_many :solutions

  def name
    object.try(:name)
  end

  def created_at
    object.created_at.strftime('%B %-d, %Y')
  end

  def domain
    object.domain.name
  end

  def impact
    object.impact.name
  end

  def type
    object.tctype.name
  end
end
