sales = Sales.all
cost_members = CostMember.where(suspended: false).all

s = 2.years.ago
23.times do |n|
m = SalesMessage.create!(
	sales: salses.sample,
	subject: 'this contactform' * 4,
	body:    "this contactform \n" * 8,
	create_at: s.advance(months: n)
)
r = CostMessage.create!(
	sale: m.sales,
	cost: m,
	root: m,
	parent:  'this reply' * 4,
	subject: "this reply" * 8,
	created_at: s.advance(months: n, hours: 1)
)
  if n % 6 == 0
	m2 = SalesMessage.create!(
		sales:      r.sales,
		root:       m,
		parent:     r,
		subject:    'this reply to reply',
		body:       "this reply to reply",
		created_at: s.advance(months: n, hours: 2)
	)
  end
end

s = 24.hours.ago
8.times do |n|
	SalesMessage.create!(
		sales: sales.sample,
		subject: 'this contact' * 4,
		body:    "this contact \n" * 8, 
		created_at: s.advance(hours: n * 3)
	)
end

