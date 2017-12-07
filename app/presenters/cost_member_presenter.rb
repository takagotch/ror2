class CostMemberPresenter < ModelPresenter
delegate :suspended ?, to : object

def suspended_mark
	suspended? ? view_context.raw('&#x2611;') : ('&#x2611;')
end
end


