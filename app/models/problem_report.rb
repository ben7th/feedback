class ProblemReport < ActiveRecord::Base
  # 验证码
  apply_simple_captcha :message => "验证码输入有误", :add_to_base => true
  
  # --- 模型关联
  belongs_to :creator, :class_name => 'User', :foreign_key => :creator_id
  belongs_to :problem_type, :class_name => 'ProblemType'
  has_many :problem_report_attachements, :foreign_key => :report_id
  
  accepts_nested_attributes_for :problem_report_attachements
  
  # --- 校验方法
  validates :content, :presence => true
  

  # --- 给其他类扩展的方法
  module UserMethods
    def self.included(base)
      base.has_many :problem_reports, :foreign_key => :creator_id

      base.send(:include, InstanceMethods)
    end
    
    module InstanceMethods

    end
  end
end
