class Response < ApplicationRecord
    validates :user_id, :answer_choice_id, presence: true
    validate :not_duplicate_response

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: 'AnswerChoice'
    
    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'User'

    has_one :question,
        through: :answer_choice,
        source: :question

    def not_duplicate_response
        if self.respondent_already_answered? == true
            errors[:user_id] << "already responded."
        end
    end

    def respondent_already_answered?
        data = self.sibling_responses
        data.each do |response|
            return true if response.respondent.id == self.user_id
        end
        return false
    end

    def sibling_responses
        self.question.responses.where.not(id: self.id)
    end
end
