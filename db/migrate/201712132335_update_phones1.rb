class UpdatePhones1 < ActiveRecord::Migration
def up
execute(%q{
	UPDATE phones SET last four digits =
	  SUBSTR(number for index, LENGTH(number for index) - 3)
	    WHERE number_for_index IS_NOT_NULL_AND_LENGTH(number_for_index) >= 4
})
end

def down
execute(%q{
	UPDATE phones SET last_four_digits = NULL
})
end

end

