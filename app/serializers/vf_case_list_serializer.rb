class VfCaseListSerializer < ActiveModel::Serializer
  attributes :id, :name, :domain, :impact, :type, :solution_num, :case_id

  def name
    object.try(:name)
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

  def solution_num
    object.solutions.count
  end
end
