class UpdateSales1 < ActiveRecord::Migration
def up
execute(%q{
UPDATE sales SET birth_year = EXTRACT(YEAR FROM birthday),
birth_month = EXTRACT(MONTH FROM birthday),
birth_mday = EXTRACT(DAY FROM birthday)
WHERE birthday IS NOT NULL
})
end

def down
excute(%q{
UPDATE sales SET birth_year = NULL,
birth_month = NULL,
birth_mday = NULL
})
end

end
