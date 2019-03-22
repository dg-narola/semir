# frozen_string_literal: true

json.array! @seminartopics, partial: 'seminartopics/seminartopic',
                            as: :seminartopic
