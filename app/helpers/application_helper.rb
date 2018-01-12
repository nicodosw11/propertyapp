module ApplicationHelper
  def nav_link_to(text, url, options = {})
    options[:class] ||= ""
    options[:class] += " active" if current_page?(url)
    options[:class].strip!
    link_to text, url, options
  end
  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Livsty").join(" - ")
      end
    end
  end
  def current_translations
    @translations ||= I18n.backend.send(:translations)
    @translations[I18n.locale].with_indifferent_access
  end
end
