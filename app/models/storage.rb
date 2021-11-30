class Storage < ApplicationRecord
    belongs_to :user
    has_one_attached :main_image

    # broadcasts_to -> (storage){'storages'}, target: :storages

    after_create_commit { broadcast_prepend_to "storages" }
    after_update_commit { broadcast_replace_to "storages" }
    after_destroy_commit { broadcast_remove_to "storages" }

end
