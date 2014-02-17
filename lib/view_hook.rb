module RougePlugin
  class ViewHook < Redmine::Hook::ViewListener
    render_on :view_layouts_base_html_head, :partial => 'rouge_css'
    end
end
