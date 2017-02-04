module ApplicationHelper
  def flash_class(level = :notice)
    style_klass = {
        notice: 'alert-success',
        success: 'alert-success',
        error: 'alert-danger',
    }
    klass = style_klass[level.to_sym]
    klass.blank? ? 'alert-danger' : klass
  end
end
