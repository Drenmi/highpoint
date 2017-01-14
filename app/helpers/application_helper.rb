module ApplicationHelper
  def sortable(column)
    css_class =
      if column.to_s == params[:sort]
        if params[:direction] == "ASC"
          "fa fa-caret-up fa-lg text-success sort-icon sort-icon-up"
        else
          "fa fa-caret-down fa-lg text-success sort-icon sort-icon-down"
        end
      else
        "fa fa-sort fa-lg sort-icon sort-icon-both"
      end

    direction =
      if column.to_s == params[:sort] && params[:direction] == "ASC"
        "DESC"
      else
        "ASC"
      end
    link_to "", safe_params(sort: column.to_s, direction: direction), class: css_class
  end

  def whodunnit(object)
    if object.versions.last&.event == "update"
      "Last updated on #{l object.versions.last.created_at.localtime} by #{User.where('id = ?', object.versions.last.whodunnit).first.email}"
    elsif object.versions.last&.event == "create" && !object.versions.last.whodunnit.nil?
      "Created on #{l object.created_at.localtime} by #{User.where('id = ?', object.versions.last&.whodunnit).first.email}"
    else
      "Created on #{l object.created_at.localtime}"
    end
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end
end
