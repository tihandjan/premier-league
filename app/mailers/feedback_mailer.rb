class FeedbackMailer < ActionMailer::Base
    default :from => 'no-reply@example.com'
    
    def feedback
        mail to: 'tihandjan198921@gmail.com', subject: 'hello Igogor:)'
    end
    
end
