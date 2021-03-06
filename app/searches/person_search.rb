class PersonSearch < Searchlight::Search
  def base_query
    Person
      .includes(:organization)
      .joins(:contact)
      .where(contacts: { account_id: options[:account_id] })
  end

  def search_with_cases
    return query unless with_cases == '1'
    query.includes(:cases).where(cases: { closed_at: nil })
  end

  def search_name
    query
      .where('first_name ILIKE ? OR last_name ILIKE ?', '%' + name + '%', '%' + name + '%')
  end

  def search_organization_id
    query.where(organization_id: organization_id)
  end
end
