class StaffMemberPresenter < ModelPresenter
  delegate :suspended?, to: :object
  # 職員の停止フラグのON/OFFを表現する記号を返す。
  def suspended_mark
    suspended? ? raw('&#x2611;') : raw('&#x2610;')
  end
end
