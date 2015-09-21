ActsAsTaggableOn.force_lowercase = true
# This is buggy!! can't do
# model.tag_list = "1,2,3,4"
# model.save
# model.tag_list = "1,2,3,4,5,6"
# model.save # => "5,6"
# did this w/ new tags.
# ActsAsTaggableOn.remove_unused_tags = true
