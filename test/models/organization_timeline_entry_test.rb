# ## Schema Information
#
# Table name: `organization_timeline_entries`
#
# ### Columns
#
# Name                                       | Type               | Attributes
# ------------------------------------------ | ------------------ | ---------------------------
# **`created_at`**                           | `datetime`         |
# **`description`**                          | `text(65535)`      |
# **`ended_at`**                             | `datetime`         |
# **`id`**                                   | `integer`          | `not null, primary key`
# **`organization_id`**                      | `integer`          |
# **`organization_timeline_entry_type_id`**  | `integer`          |
# **`started_at`**                           | `datetime`         |
# **`updated_at`**                           | `datetime`         |
#
# ### Indexes
#
# * `index_organization_timeline_entries_on_organization_id`:
#     * **`organization_id`**
# * `index_timeline_entries_on_type`:
#     * **`organization_timeline_entry_type_id`**
#

require 'test_helper'

class OrganizationTimelineEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
