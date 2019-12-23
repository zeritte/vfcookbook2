class VfCaseListSerializer < ActiveModel::Serializer
  attributes :id, :name, :domain, :impact, :type, :is_active, :case_id

  def name
    object.try(:name)
  end

  def domain
    object.domain.try(:name)
  end

  def impact
    object.impact.try(:name)
  end

  def type
    object.tctype.try(:name)
  end
end
