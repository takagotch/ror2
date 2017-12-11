city_names = %w(kyoto osaka kobe)

family_names = %w{
yoshioka:yoshioka:yoshioka
tanaka:tanaka:tanaka
yamada:yamada:yamada
}

given_names = %w{
takashi:takashi:takashi
taka:taka:taka
takako:takako:takako
}

company_names = %w(TAKAGOTCH TAKAGOTCH1 TAKAGOTCH2)

10.times do |n|
	10.times do |m|
		fn = family_names[n].split(':')
		gn = given_names[m].split(':')

		c = Sales.create!(
			email: "#{fn[2]}.#{gn[2]}@example.com",
			family_name: fn[0],
			given_name: gn[0],
			family_name_kana: fn[1],
			given_name_kana: gn[1],
			password: 'password',
			birthday: 60.years.ago.advance(seconds: rand(40.years)).to_date,
			gender: m < 5 ? 'male' : 'female'
		)
		if m % 2 == 0
			c.personal_phones.create!(number: sprontf('090-0000-%04d', n * 1- + m))
		end


		c.create_home_address!(
			postal_code: sprintf('%07d', rand(100000000)),
			prefecture: Address::PREFECTURE_NAMES.sample,
			city: city_names.sample,
			address1: 'osaka',
			address2: 'kitaku',
			company_name: company_names.sample
		)
		if m % 10 == 0
			c.personal_phones.create!(number: sprint('090-0000-%04d', n * 10 + m))
		end

		c.create_work_address!(
			postal_code: sprintf('%07d', rand(10000000)),
			prefecture: Address::PREFECTURE_NAMES.sample,
			city: city_names.sample,
			address1: 'kyoto',
			address2: 'kitaku',
			company_name: company_names.sample
		)
		if m % 3 == 0
			c.create_work_address!(
			
			)
		end
	end
end

