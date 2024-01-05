# SPM
class Spm < ApplicationRecord
  validates :spm_base, :study_date, presence: true
  belongs_to :patient
end
