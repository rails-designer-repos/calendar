CalendarRange = Data.define(:month, :start, :finish) do
  def self.from(date, week_start:)
    month = date.beginning_of_month

    new(
      month:,
      start: month.beginning_of_week(week_start),
      finish: month.end_of_month.end_of_week(week_start)
    )
  end

  def days = (start..finish).to_a

  def header_days = days.first(7)
end
