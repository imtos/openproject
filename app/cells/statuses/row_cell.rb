module Statuses
  class RowCell < ::RowCell
    include ::IconsHelper
    include ::ColorsHelper
    include ReorderLinksHelper

    def status
      model
    end

    def name
      link_to status.name, edit_status_path(status)
    end

    def is_default
      checkmark(status.is_default?)
    end

    def is_closed
      checkmark(status.is_closed?)
    end

    def is_readonly
      checkmark(status.is_readonly?)
    end

    def color
      icon_for_color status.color
    end

    def done_ratio
      h(status.default_done_ratio)
    end

    def sort
      reorder_links 'status',
                    { action: 'update', id: status },
                    method: :patch
    end

    def button_links
      [
        delete_link(status_path(status))
      ]
    end
  end
end
