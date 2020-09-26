class User < ApplicationRecord
	has_secure_password
	has_many :contents
	validates :email, uniqueness: true #이메일 하나에 여러가지 옵션
	
	#validates_uniqueness_of :email #유니크 검사를 여러개의 데이터에서 적용 가능
end
