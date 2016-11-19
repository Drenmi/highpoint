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
end
