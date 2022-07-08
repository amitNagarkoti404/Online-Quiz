class CourseSerializer < ActiveModel::Serializer
  attributes :id, :course_name
  has_one :department
end
